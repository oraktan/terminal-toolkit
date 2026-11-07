#!/usr/bin/env python3
"""Download verified GitHub release assets into apps/; no system package manager."""
import hashlib, json, os, pathlib, shutil, sys, tarfile, tempfile, urllib.request, zipfile
ROOT = pathlib.Path(__file__).resolve().parents[1]
DEST = ROOT / 'apps'
# Pin versions by editing these tags after reviewing upstream release notes.
RELEASES = {
    'nvim': ('neovim/neovim', 'v0.12.5', 'nvim-linux-x86_64.tar.gz'),
    'yazi': ('sxyazi/yazi', 'v26.9.1', 'yazi-x86_64-unknown-linux-musl.zip'),
    'fzf': ('junegunn/fzf', 'v0.74.5', 'fzf-0.74.5-linux_amd64.tar.gz'),
    'fd': ('sharkdp/fd', 'v10.4.2', 'fd-v10.4.2-x86_64-unknown-linux-musl.tar.gz'),
    'rg': ('BurntSushi/ripgrep', '15.1.0', 'ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz'),
    'starship': ('starship/starship', 'v1.24.2', 'starship-x86_64-unknown-linux-musl.tar.gz'),
}
if os.uname().machine != 'x86_64' or sys.platform != 'linux':
    sys.exit('Yalnizca Linux x86_64 destekleniyor')

def get(url):
    req = urllib.request.Request(url, headers={'User-Agent':'terminal-toolkit-portable/1.0', 'Accept':'application/vnd.github+json'})
    return urllib.request.urlopen(req, timeout=60)

def safe_extract(path, destination):
    destination.mkdir(parents=True, exist_ok=True)
    if path.name.endswith('.zip'):
        with zipfile.ZipFile(path) as z:
            for item in z.infolist():
                name = pathlib.PurePosixPath(item.filename)
                if name.is_absolute() or '..' in name.parts or ((item.external_attr >> 16) & 0o170000) == 0o120000:
                    raise ValueError('Unsafe zip member: '+item.filename)
            z.extractall(destination)
    else:
        with tarfile.open(path, 'r:gz') as t:
            for m in t.getmembers():
                name = pathlib.PurePosixPath(m.name)
                if name.is_absolute() or '..' in name.parts or not (m.isfile() or m.isdir()):
                    raise ValueError('Unsafe tar member: '+m.name)
            t.extractall(destination, filter='data')

for name, (repo, tag, asset_name) in RELEASES.items():
    print(f'[{name}] {repo} {tag} {asset_name}', flush=True)
    try:
        with get(f'https://api.github.com/repos/{repo}/releases/tags/{tag}') as response:
            release = json.load(response)
        asset = next((a for a in release['assets'] if a['name'] == asset_name), None)
        if asset is None:
            raise RuntimeError('Release asset bulunamadi; upstream surum ve dosya adini kontrol edin')
        digest = asset.get('digest', '')
        if not digest.startswith('sha256:'):
            raise RuntimeError('GitHub API SHA-256 digest saglamiyor; dogrulanmamis dosya kurulmaz')
        with tempfile.TemporaryDirectory(prefix='toolkit-download-') as temp:
            archive = pathlib.Path(temp) / asset_name
            h = hashlib.sha256()
            with get(asset['browser_download_url']) as src, archive.open('wb') as out:
                while block := src.read(1024 * 1024):
                    h.update(block); out.write(block)
            if h.hexdigest().lower() != digest.split(':',1)[1].lower():
                raise RuntimeError('SHA256 uyusmazligi')
            extracted = pathlib.Path(temp) / 'extracted'
            safe_extract(archive, extracted)
            candidates = list(extracted.rglob(name))
            candidates = [p for p in candidates if p.is_file() and (name == 'yazi' or (p.stat().st_mode & 0o111))]
            if name == 'yazi':
                for candidate in candidates:
                    candidate.chmod(candidate.stat().st_mode | 0o755)
            if not candidates:
                raise RuntimeError('Calistirilabilir dosya bulunamadi')
            stage = DEST / (name + '.new')
            if stage.exists(): shutil.rmtree(stage)
            shutil.copytree(extracted, stage, symlinks=False)
            (stage / '.entry').write_text(str(candidates[0].relative_to(extracted))+'\n')
            final = DEST / name
            if final.exists():
                old = DEST / (name + '.previous')
                if old.exists(): shutil.rmtree(old)
                final.rename(old)
            stage.rename(final)
            print('  OK: SHA256 verified', flush=True)
    except Exception as exc:
        print(f'  FAILED: {exc}', file=sys.stderr)
        sys.exit(1)
print('Hazir. bash toolbox.sh --doctor --full')
