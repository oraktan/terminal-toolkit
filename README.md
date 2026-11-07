# Terminal Toolkit Portable

Linux x86_64 icin tasinabilir Bash, Neovim, Yazi, fzf, fd,
ripgrep ve Starship ortami.

Normal ~/.bashrc dosyasini degistirmez.

## Destek hedefi

- Fedora
- Ubuntu
- Debian
- Rocky Linux
- AlmaLinux

Fedora uzerinde test edilmistir. Diger dagitimlarda uyumluluk
testleri gereklidir. Linux x86_64 ve uygun sistem kutuphaneleri
gereklidir.

## Kaynak koddan hazirlama

Gereksinimler: Bash, Python 3 ve internet baglantisi.

    git clone https://github.com/oraktan/terminal-toolkit.git
    cd terminal-toolkit
    python3 scripts/build-portable.py
    bash toolbox.sh --doctor --full

## Offline kullanim

GitHub Releases bolumunden hazir Linux x86_64 arsivini indirin.

    tar -xzf terminal-toolkit-linux-x86_64.tar.gz
    cd terminal-toolkit
    bash toolbox.sh --full

Hazir arsiv uygulamalari icerir ve indirme gerektirmez.
Hedef bilgisayarda Bash ve gerekli temel sistem kutuphaneleri
bulunmalidir.

## Baslatma

    bash toolbox.sh --server
    bash toolbox.sh --full
    bash toolbox.sh --server --tmux
    bash toolbox.sh --doctor --full

tmux modu icin sistemde tmux kurulu olmalidir.

## Komutlar

- Dosya: ll, la, l, dir, .., ..., ...., home, downloads, croot, duf
- Arama: ff, vf, cf, fif METIN, fhere METIN
- Git: gs, gd, gl
- Editor: v, vim, y
- Diger: doctor, nedir, pyserve, untar

Ek fonksiyonlar: config/bash/functions.sh

## Offline paket olusturma

    python3 scripts/build-portable.py
    bash scripts/package-offline.sh

Olusan arsiv varsayilan olarak proje klasorunun ust dizinine yazilir.

## Guvenlik

Parola, token, SSH anahtari veya ozel sunucu bilgilerini
repository'ye eklemeyin. Normal kullanici yetkileriyle calistirin.
