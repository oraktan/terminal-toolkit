# Terminal Toolkit v0.2

Taşınabilir, geçici Bash + Neovim + Yazi çalışma ortamı. Rocky Linux, Fedora vb. Linux makinelerinde denenebilir. Sistem shell ayarlarını değiştirmez, kendiliğinden paket yüklemez.

## Başlatma

```bash
bash toolbox.sh --server
bash toolbox.sh --full
bash toolbox.sh --server --tmux
bash toolbox.sh --doctor --full
```

`exit` ile geçici shell'den çık. `--tmux` oturumu sunucuda korur; `Ctrl+B`, sonra `D` ile ayrıl.

## Komutlar

`doctor`, `nvim`, `yazi`, `vf`, `cf`, `ff`, `fif`, `gs`, `gd`, `gl`, `croot`.

Neovim kendi `config/nvim/init.vim` dosyasını kullanır. Sistem Neovim ayarını değiştirmez. `Space+w` kaydet, `Space+q` çık, `Space+c` Markdown kod bloğu. Eklenti kurulumu otomatik yapılmaz. Yazi yapılandırması ayrı yüklenir.

## Güvenlik ve sınırlar

- Programlar sistemde mevcut olmalı; `--full` yalnızca ek araçları bildirir, otomatik kurmaz.
- `toolbox.sh` normal Bash oturumudur; `--tmux` için tmux kurulu olmalı.
- Toolkit için Neovim/Yazi veri ve önbellek dizinleri kullanıcının ev dizininde ayrı tutulur ve `exit` ile silinmez.
- Root yerine normal kullanıcı tercih edin. Public repoya SSH anahtarı, parola, token veya kişisel sunucu adresi koymayın.
- macOS ve Windows için henüz test yapılmadı.

## Public GitHub

Depoyu oluşturduktan sonra içerikleri commit edip push edin. GitHub'a kendiliğinden yüklenmez.
