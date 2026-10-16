# Terminal Toolkit v0.3

Her Linux makinesinde bağımsız, geçici Bash ortamı. Fedora 44 ve Rocky Linux 9.8 üzerinde önceki sürümün açılışı doğrulandı; bu güncelleme ayrıca test edilmelidir.

```bash
git clone https://github.com/oraktan/terminal-toolkit.git
cd terminal-toolkit
bash toolbox.sh --server
# veya: bash toolbox.sh --full
# veya: bash toolbox.sh --server --tmux
# denetim: bash toolbox.sh --doctor --full
```

`exit` ile normal kabuğa dönersin. `~/.bashrc`, `~/.zshrc` veya sistem Neovim/Yazi ayarları değiştirilmez. Araçları yüklemez; yüklü değilse `doctor` gösterir. Sunucu üzerinde root yerine normal kullanıcı tavsiye edilir.

## Taşınabilir komutlar

- **Klasör:** `ll`, `la`, `l`, `dir`, `..`, `...`, `....`, `home`, `downloads`, `mkcd AD`, `croot`, `duh`, `duf`, `maxdosya 10`
- **Arama:** `ff` (dosya seç), `vf` (Neovim'de aç), `cf` (dizine gir), `fif METIN` (dosya içeriğinde ara)
- **Git:** `gs`, `gd`, `gl`
- **Diğer:** `v`, `vim`, `y`, `psg KELIME`, `ports`, `myip`, `nedir`, `pyserve`, `untar DOSYA`

Yalnızca taşınabilir, görece güvenli komutlar public repoya eklendi. Kişisel SSH adresleri, disk cihaz adları, DNF'ye özel otomatik kurulum, tehlikeli `pkill -9`, çöpü silme ve özel dosya yolları dışarıda bırakıldı. `yy`, `f`, `n` fonksiyonlarının kaynak gövdeleri paylaşılmadığı için henüz aktarılmadı.

Neovim ve Yazi `bin/` sarmalayıcılarıyla sadece kendi süreçleri için izole XDG yapılandırması kullanır. `Space+w` kaydet, `Space+q` çık, `Space+c` Markdown kod bloğu.

## Güncelleme ve GitHub'a gönderme

Bu dosyaları **Fedora'daki ayrı terminal-toolkit Git deposuna** kopyalayıp incele. `git add` sadece proje içindeki dosyaları hedeflemeli. `git diff --cached` ile kontrol edip commit/push et. Paket GitHub'a kendiliğinden gönderilmez.
