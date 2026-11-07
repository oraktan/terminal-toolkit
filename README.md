# 🧰 Terminal Toolkit

**Taşınabilir, modern ve izole Linux terminal ortamı.**

Terminal Toolkit; Neovim, Yazi, fzf, fd, ripgrep ve Starship araçlarını tek bir pakette birleştiren, Linux x86_64 sistemleri için hazırlanmış bir terminal araç setidir.

Kendi Bash yapılandırmanı, alias'larını ve terminal araçlarını farklı bilgisayarlara taşımanı sağlar.

> **Önemli:** Terminal Toolkit, mevcut `~/.bashrc` dosyanı değiştirmez. Kendi izole Bash oturumunda çalışır.

## ✨ Özellikler

- **Taşınabilir:** Uygulamaları ve yapılandırmaları tek klasörde tutar.
- **Offline kullanım:** Hazır paket indirildikten sonra uygulamaları çalıştırmak için internet gerekmez.
- **İzole Bash:** Mevcut terminal yapılandırmanı değiştirmez.
- **Neovim:** Kendi yapılandırması ve runtime dosyalarıyla gelir.
- **Yazi:** Terminal tabanlı dosya yöneticisi.
- **fzf:** İnteraktif bulanık arama.
- **fd:** Hızlı dosya ve dizin arama.
- **ripgrep:** Dosya içeriklerinde hızlı metin arama.
- **Starship:** Modern ve özelleştirilebilir terminal görünümü.
- **Özel komutlar:** Alias'lar ve Bash fonksiyonları.

## 🐧 Linux uyumluluğu

| Dağıtım | Durum |
|---|---|
| Fedora Linux x86_64 | ✅ Test edildi |
| Ubuntu x86_64 | ⏳ Test bekliyor |
| Debian x86_64 | ⏳ Test bekliyor |
| Rocky Linux x86_64 | ⏳ Test bekliyor |
| AlmaLinux x86_64 | ⏳ Test bekliyor |

Toolkit, Linux x86_64 mimarisi için hazırlanmıştır. Hedef sistemde Bash ve gerekli temel sistem kütüphaneleri bulunmalıdır.

## 📦 Kurulum

### Yöntem 1 — Hazır offline paket (önerilen)

En kolay kurulum yöntemi, bütün uygulamaları içeren hazır paketi indirmektir.

**1.** [GitHub Releases](https://github.com/oraktan/terminal-toolkit/releases) sayfasından `terminal-toolkit-linux-x86_64.tar.gz` dosyasını indir.

**2.** Arşivi çıkar:

```bash
tar -xzf terminal-toolkit-linux-x86_64.tar.gz
```

**3.** Toolkit klasörüne gir:

```bash
cd terminal-toolkit
```

**4.** Terminal Toolkit'i başlat:

```bash
bash toolbox.sh --full
```

Hazır paket, gerekli uygulama dosyalarını içerir. Desteklenen bir Linux sisteminde ek uygulama indirmeden kullanılabilir.

### Yöntem 2 — GitHub üzerinden kaynak koddan kurulum

Bu yöntem internet bağlantısı ve Python 3 gerektirir.

```bash
git clone https://github.com/oraktan/terminal-toolkit.git
cd terminal-toolkit
python3 scripts/build-portable.py
bash toolbox.sh --doctor --full
bash toolbox.sh --full
```

`build-portable.py`, uygulamaların sabitlenmiş sürümlerini indirir ve paket özetlerini doğrular.

## 🚀 Kullanım

| Komut | Açıklama |
|---|---|
| `bash toolbox.sh --full` | Tam terminal ortamını başlatır |
| `bash toolbox.sh --server` | Sunucu profilini başlatır |
| `bash toolbox.sh --server --tmux` | Sunucu profilini tmux ile başlatır |
| `bash toolbox.sh --doctor --full` | Taşınabilir uygulamaları kontrol eder |

`--tmux` seçeneği için hedef sistemde `tmux` kurulu olmalıdır.

Toolkit oturumundan çıkmak için:

```bash
exit
```

## ⌨️ Alias'lar ve yardımcı komutlar

### Dosya ve dizin işlemleri

| Komut | İşlev |
|---|---|
| `ll` | Ayrıntılı dosya listesi |
| `la` | Gizli dosyalar dahil listeleme |
| `l` | Kısa listeleme |
| `..` | Bir üst dizine geç |
| `...` | İki üst dizine geç |
| `....` | Üç üst dizine geç |
| `home` | Ev dizinine geç |
| `downloads` | İndirilenler klasörüne geç |
| `croot` | Terminal Toolkit ana dizinine geç |
| `duf` | Dosya ve klasör boyutlarını listele |

### Dosya ve içerik arama

| Komut | İşlev |
|---|---|
| `ff` | fzf ile dosya seç |
| `vf` | fzf ile dosya seçip Neovim'de aç |
| `cf` | fzf ile dizin seçip içine gir |
| `fif METİN` | Dosya içeriğinde ara ve sonucu Neovim'de aç |
| `fhere METİN` | Dosya ve dizin adlarında arama yap |

### Git komutları

| Komut | İşlev |
|---|---|
| `gs` | Git durumunu göster |
| `gd` | Değişiklikleri göster |
| `gl` | Son 10 commit'i göster |

### Diğer komutlar

| Komut | İşlev |
|---|---|
| `v` veya `vim` | Neovim'i aç |
| `y` | Yazi'yi aç |
| `doctor` | Toolkit sağlık kontrolünü çalıştır |
| `nedir` | Linux dağıtım bilgilerini göster |
| `pyserve` | Python HTTP sunucusu başlat |
| `untar DOSYA` | `.tar.gz` arşivini çıkar |

Ek Bash fonksiyonları `config/bash/functions.sh` dosyasında bulunur.

## 📁 Proje yapısı

```text
terminal-toolkit/
├── apps/                     # Portable uygulamalar (hazır pakette)
│   ├── nvim/
│   ├── yazi/
│   ├── fzf/
│   ├── fd/
│   ├── rg/
│   └── starship/
├── bin/                      # Uygulama başlatıcıları
├── config/
│   ├── bash/
│   │   ├── bashrc
│   │   ├── aliases.sh
│   │   └── functions.sh
│   ├── nvim/
│   ├── yazi/
│   └── starship.toml
├── scripts/
│   ├── build-portable.py
│   ├── doctor.sh
│   └── package-offline.sh
├── toolbox.sh
└── README.md
```

> `apps/` klasörü Git kaynak deposunda bulunmaz; hazırlama işlemi sırasında oluşturulur veya hazır offline arşivle birlikte gelir.

## 🛠️ Kendi offline paketini oluştur

Kaynak kodu klonladıktan sonra:

```bash
python3 scripts/build-portable.py
bash toolbox.sh --doctor --full
bash scripts/package-offline.sh
```

Başarılı işlem sonunda proje klasörünün üst dizininde şu dosya oluşturulur:

```text
terminal-toolkit-linux-x86_64.tar.gz
```

Arşiv bütün taşınabilir uygulamaları ve yapılandırmaları içerir. USB bellekle veya başka bir yöntemle hedef Linux bilgisayarına aktarılabilir.

## 🔒 Güvenlik

- Toolkit'i normal kullanıcı yetkileriyle çalıştır.
- Parola, token, SSH anahtarı veya kişisel sunucu bilgilerini GitHub deposuna ekleme.
- İndirilen uygulamaların SHA-256 doğrulaması hazırlama betiği tarafından yapılır.
- Kaynağı güvenilir olmayan arşivleri çalıştırma.
- Toolkit sistem genelindeki Bash yapılandırmasını değiştirmez.

## 🧪 Test durumu

Şu ana kadar Fedora Linux x86_64 üzerinde aşağıdaki kontroller başarıyla tamamlanmıştır:

- Altı uygulamanın sürüm ve çalıştırma kontrolleri.
- Neovim'in kendi taşınabilir runtime dizinini kullanması.
- Offline arşiv oluşturulması.
- Arşivin farklı bir dizine çıkarılıp çalıştırılması.

Ubuntu, Debian, Rocky Linux ve AlmaLinux üzerindeki testler henüz tamamlanmamıştır.

## 🔗 Bağlantılar

**Kaynak kod:** https://github.com/oraktan/terminal-toolkit

**Hazır paketler:** https://github.com/oraktan/terminal-toolkit/releases

---

**Terminal Toolkit — Terminalini yanında taşı.**
