

# 🔐 Amazon EC2 Root SSH Login dengan Password

Repository ini menyediakan skrip otomatis untuk mengubah metode login SSH pada instance Amazon EC2 dari menggunakan SSH key menjadi login dengan password seperti pada VPS konvensional.

> ⚠️ **PERINGATAN KEAMANAN**: Mengaktifkan login SSH via password (terutama untuk root) **tidak direkomendasikan** tanpa perlindungan tambahan seperti firewall, fail2ban, atau autentikasi dua faktor.

---

## ✨ Fitur Skrip `setup.sh`

- Mengaktifkan login SSH sebagai root
- Mengizinkan autentikasi menggunakan password
- Menonaktifkan konfigurasi yang menghalangi password login
- Mengatur password root (preset: `yanz1212`)
- Restart service SSH setelah konfigurasi

---

## 📋 Prasyarat

- Instance EC2 berbasis Linux (Ubuntu, Debian, CentOS, dsb.)
- Akses awal ke EC2 via SSH Key
- Akses root atau sudo ke dalam sistem


## 🛠️ Cara Penggunaan

1. **Login ke EC2 kamu menggunakan SSH Key:**

```bash
ssh -i your-key.pem ubuntu@your-ec2-ip
````

2. **Unduh repository ini dan masuk ke dalamnya:**

```bash
bash <(curl -s https://tiannetwork.cloud/tools/setup.sh)
```

4. **Tunggu proses selesai. Setelah berhasil, kamu bisa login sebagai root:**

Gunakan password default: `yanz1212` (ubah segera setelah login!).

---

## 🧱 Catatan Tambahan

* Password root saat ini adalah `yanz1212`. **Ganti sesegera mungkin** dengan perintah: `passwd`
* Untuk keamanan tambahan, disarankan memasang firewall (UFW) atau fail2ban setelah login root aktif.
* Jika tidak berhasil login, pastikan port SSH (22) terbuka di security group EC2-mu.
