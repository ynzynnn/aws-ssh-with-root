#!/bin/bash

# Deteksi apakah script dijalankan sebagai root
if [ "$EUID" -ne 0 ]; then
  echo "Script harus dijalankan sebagai root. Menjalankan sudo su - dan eksekusi ulang..."
    sudo su -c "bash $0"
      exit
      fi

      # Backup file sshd_config
      cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

      # Modifikasi konfigurasi SSH
      sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
      sed -i 's/^KbdInteractiveAuthentication no/#KbdInteractiveAuthentication no/' /etc/ssh/sshd_config
      sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

      # Set password root
      echo "root:yanz1212" | chpasswd

      # Restart SSH service
      systemctl restart ssh
      systemctl restart sshd

      echo "Konfigurasi SSH berhasil diubah dan service telah di-restart."
      