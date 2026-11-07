# Terminal Toolkit v0.3

Taşınabilir, izole Bash + Neovim + Yazi çalışma ortamı. Kişisel shell ayarlarını değiştirmez.

## Başlatma

```bash
bash toolbox.sh --server
bash toolbox.sh --full
bash toolbox.sh --server --tmux
bash toolbox.sh --doctor --full
```

`exit` ile çıkılır. `--tmux` için tmux kurulu olmalıdır.

## Komutlar

- Dosya: `ll`, `la`, `l`, `dir`, `..`, `...`, `....`, `home`, `downloads`, `croot`, `duf`
- Arama: `ff`, `vf`, `cf`, `fif METIN`
- Git: `gs`, `gd`, `gl`
- Diğer: `v`, `vim`, `y`, `doctor`, `nedir`, `pyserve`, `untar DOSYA`
- Ek fonksiyonlar: `config/bash/functions.sh`

Neovim ve Yazi yapılandırmaları `bin/` wrapper'larıyla izole edilir. Mevcut sistem shell ayarları değiştirilmez.

## Offline çalışma

Bu repository şu anda eksiksiz, tüm sistemlerde bağımsız çalışan bir offline paket olarak doğrulanmamıştır. `bin/` altındaki wrapper'lar, gerçek programları ve onların bağımlılıklarını içermez. Hedef mimariye uygun binary'ler, runtime dosyaları ve gereken kütüphaneler ayrıca paketlenip test edilmelidir. `doctor` mevcut araçları gösterir; otomatik yükleme yapmaz.

## Güvenlik

Public repository'ye parola, token, SSH anahtarı veya kişisel sunucu bilgileri eklemeyin. Normal kullanıcıyla çalıştırın.
