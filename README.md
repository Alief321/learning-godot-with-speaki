# 2D Game — Trickkall Chibi Go (Godot/GDScript)

Game 2D sederhana dengan karakter dari Trickkall Chibi Go, dibuat menggunakan Godot Engine dan GDScript. Proyek ini berfokus pada gerakan karakter, musuh sederhana, HUD, dan audio dasar sebagai pondasi untuk dikembangkan lebih lanjut.

## Fitur

- Gerak karakter pemain dengan animasi dasar.
- Musuh (`enemy.tscn`) dengan perilaku sederhana.
- HUD skor/nyawa (`hud.tscn`).
- Scene utama (`main.tscn`) sebagai entry point.
- Audio latar dan efek suara dasar.

## Video Demo
https://github.com/user-attachments/assets/fdc6c500-f8da-45a4-b991-cf1cb9b579fc


## Kontrol

- WASD / Panah: gerak
- Esc: keluar

## Struktur Proyek (ringkas)

- `main.tscn`, `main.gd`: Scene utama dan logika game loop.
- `player.tscn`, `player.gd`: Pemain dan kontrol.
- `enemy.tscn`, `enemy.gd`: Musuh.
- `hud.tscn`, `hud.gd`: Tampilan layout button.
- `assets/`, `art/`, `fonts/`: Aset gambar, audio, dan font.
- `addons/`: Plugin pihak ketiga (ambientcg, properUI_toast, udim_material, dsb.).

## Prasyarat

- Godot Engine (disarankan versi terbaru 4.x). Jika proyek Anda menggunakan versi lain, sesuaikan di editor.

## Cara Menjalankan (Windows)

1. Buka Godot > Open > pilih folder proyek ini (yang memiliki `project.godot`).
2. Pastikan scene utama diarahkan ke `main.tscn` (Project > Project Settings > Application > Run > Main Scene).
3. Tekan F5 (Play) untuk menjalankan.

Opsional (CLI, jika `godot.exe` tersedia di PATH):

```powershell
godot.exe --path "." --editor
# atau langsung main scene (sesuaikan path godot.exe Anda)
godot.exe --path "." --play
```

## Build/Export

1. Project > Export…
2. Tambahkan preset target (Windows, Web, Android, dsb.)
3. Atur ikon, nama aplikasi, versi, dan opsi rilis sesuai kebutuhan.
4. Klik Export.

## Aset & Kredit

- Karakter: Trickkall Chibi Go (terima kasih kepada pembuatnya). Pastikan mengikuti ketentuan lisensi aset tersebut.
- Tekstur prototipe: Kenney (folder `addons/kenney_prototype_textures`).
- Material/UI pendukung: ambientCG plugin, Proper UI Toast, dan UDIM Material (di `addons/`).
- Audio: file dalam `art/` dan `assets/` mengikuti lisensi masing-masing.

Jika Anda menggunakan aset tambahan, harap tambahkan kredit dan lisensinya di bagian ini.

## Kustomisasi

- Input: Project > Project Settings > Input Map (atur binding untuk gerak/aksi).
- Kecepatan pemain, jumlah nyawa, frekuensi spawn musuh, dan parameter lain dapat disesuaikan di script terkait (`player.gd`, `enemy.gd`, `main.gd`, `hud.gd`).

## Roadmap Singkat

- Penyempurnaan AI musuh (pola gerak & kesulitan bertahap).
- Sistem level/gelombang.
- Efek partikel & feedback visual.
- Penyelamatan skor tertinggi (local save).

## Kontribusi

Pull request dan issue dipersilakan. Sertakan deskripsi singkat perubahan Anda, langkah uji, dan tangkapan layar jika relevan.

