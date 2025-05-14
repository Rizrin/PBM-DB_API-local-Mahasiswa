# app_dbapi

📱 Flutter Project: Manajemen Data Mahasiswa
Project ini merupakan aplikasi mobile berbasis Flutter yang terhubung dengan API lokal (PHP + MySQL via XAMPP). Aplikasi ini memungkinkan pengguna untuk melakukan manajemen data Mahasiswa, Hobi, Organisasi, dan User secara lengkap, mulai dari Create, Read, Update, hingga Delete (CRUD).

## ✨ Fitur Aplikasi

- 📋 Menampilkan daftar data mahasiswa
- 🧑‍🎓 Relasi mahasiswa dengan program studi (Prodi)
- 🎯 Pengelolaan hobi yang dimiliki mahasiswa
- 🏢 Integrasi data organisasi tempat mahasiswa tergabung
- 👤 Manajemen user aplikasi
- 🔄 Semua data diambil dari dan dikirim ke REST API lokal berbasis PHP yang terhubung ke     phpMyAdmin (XAMPP)

## 🧠 Teknologi yang Digunakan

- Flutter (Frontend)
- Dart
- PHP (Backend - API)
- MySQL (Database)
- XAMPP (Local Server)

## ⚙️ Cara Menjalankan Project
## 🔧 Backend (XAMPP)

- Jalankan XAMPP dan aktifkan Apache & MySQL.
- Import file database ke dalam phpMyAdmin.
- Pastikan folder berisi file PHP API berada di direktori htdocs/.
- Cek API endpoint dengan browser/Postman (http://localhost/nama_folder_api/...).

## 📱 Frontend (Flutter)
- Clone atau download project ini.
- Buka dengan Android Studio / VSCode.
- Jalankan perintah berikut:
  flutter pub get
  flutter run
- Pastikan emulator atau device sudah terkoneksi.

## 👨‍💻 Kontributor

| Nama Lengkap        | NIM         |
| ------------------- | ----------- |
| Christian Santoso   | 23.240.0006 |
| Muhammad Irsyad     | 23.240.0008 |
| Suluh Aulia Ariffin | 23.240.0040 |
| Optima Amar         | 23.240.0069 |

## 📌 Catatan

- Pastikan koneksi API dengan Flutter sudah sesuai (ubah baseUrl jika perlu).
- Jika ingin menggunakan di jaringan yang berbeda (bukan localhost), gunakan IP dari    perangkat server.

