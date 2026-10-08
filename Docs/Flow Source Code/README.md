# Penjelasan Source Code Per Baris: `uts_live_coding`

Urutan mengikuti alur aplikasi: `main.dart` → `homepage.dart` → `profile.dart` → `kalkulator.dart`.
Baris yang sifatnya sama (kurung penutup, spasi kosong) digabung atau dilewati agar ringkas.

---

## 1) `main.dart`

Titik awal aplikasi: menjalankan `MyApp` dan membuka `Homepage` lewat route awal.

```dart
import 'package:flutter/material.dart';  // library Flutter bergaya Material (MaterialApp, Scaffold, dll)
import 'homepage.dart';                  // agar class Homepage bisa dipakai di file ini
import 'kalkulator.dart';                // agar class KalkulatorSederhana bisa dipakai
import 'profile.dart';                   // agar class ProfilePage bisa dipakai

void main() {                            // fungsi pertama yang dijalankan Dart
  runApp(const MyApp());                 // menampilkan MyApp sebagai widget paling atas (root)
}

class MyApp extends StatelessWidget {    // widget root; Stateless karena tidak ada data yang berubah
  const MyApp({super.key});              // constructor const; key diteruskan ke class induk

  @override
  Widget build(BuildContext context) {   // dipanggil Flutter untuk menggambar widget ini
    return MaterialApp(                  // pembungkus aplikasi: tema + sistem navigasi
      title: 'Menu Navigator',           // judul aplikasi (dipakai sistem, bukan teks di layar)
      initialRoute: '/',                 // route yang dibuka pertama kali
      routes: {                          // daftar nama route dan halaman tujuannya
        '/': (context) => const Homepage(),                      // '/' membuka Homepage
        '/profile': (context) => const ProfilePage(),            // terdaftar, tapi tidak dipakai
        '/kalkulator': (context) => const KalkulatorSederhana(), // terdaftar, tapi tidak dipakai
      },
    );
  }
}

class FirstRoute extends StatelessWidget { ... return const Homepage(); }
class SecondRoute extends StatelessWidget { ... return const ProfilePage(); }
class ThirdRoute extends StatelessWidget { ... }  // file yang diunggah terpotong di sini
```

**Catatan:**
- `FirstRoute`, `SecondRoute`, `ThirdRoute` tidak dipanggil di mana pun, jadi tidak memengaruhi flow.
- File yang diterima **terpotong** di `ThirdRoute` (method `build` tidak selesai). Jika file asli memang begitu, kode akan error saat di-compile.

---

## 2) `homepage.dart`

Halaman menu dengan dua tombol yang membuka halaman lain memakai `Navigator.push`.

```dart
import 'package:flutter/material.dart';
import 'kalkulator.dart';   // untuk Page2 (menuju kalkulator)
import 'profile.dart';      // untuk ProfilePage (menuju profil)

class Homepage extends StatelessWidget {   // halaman menu, tidak ada data berubah
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(                       // kerangka halaman (AppBar + body)
      backgroundColor: Colors.white,       // latar halaman putih
      appBar: AppBar(                      // bar judul di atas
        title: const Text(
          'Menu Navigator',                // teks judul
          style: TextStyle(color: Colors.black),  // warna teks hitam
        ),
        backgroundColor: Colors.yellow,    // warna AppBar kuning
        centerTitle: false,                // judul rata kiri
      ),
      body: Center(                        // isi halaman diletakkan di tengah
        child: Column(                     // susun widget ke bawah
          mainAxisAlignment: MainAxisAlignment.center,  // rata tengah secara vertikal
          children: [
            ElevatedButton(                // tombol Menu 1
              onPressed: () {              // dijalankan saat tombol ditekan
                Navigator.push(            // buka halaman baru di atas halaman sekarang
                  context,                 // posisi widget di pohon; dibutuhkan Navigator
                  MaterialPageRoute(builder: (context) => const Page1()),  // halaman tujuan: Page1
                );
              },
              child: const Text('Menu 1'), // tulisan di tombol
            ),
            const SizedBox(height: 20),    // jarak 20 piksel antar tombol
            ElevatedButton(                // tombol Menu 2
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page2()),  // halaman tujuan: Page2
                );
              },
              child: const Text('Menu 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {      // class perantara
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePage();            // Page1 langsung menampilkan ProfilePage
  }
}
```

**Catatan:** `Page2` tidak didefinisikan di file ini. Ia ada di `kalkulator.dart` dan bisa dipakai karena ada `import 'kalkulator.dart';`.

---

## 3) `profile.dart`

Halaman tujuan Menu 1: menampilkan kartu profil, tanpa logika dan tanpa navigasi sendiri.

```dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {   // halaman profil (tujuan Menu 1)
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,         // AppBar hijau tosca
        centerTitle: false,
        title: const Text('Profile'),         // judul halaman
      ),
      body: const Center(child: ProfilCard()),  // kartu profil di tengah layar
    );
  }
}

class ProfilCard extends StatelessWidget {    // widget kartu profil
  const ProfilCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(                         // kotak pembungkus kartu
      width: 300,                             // lebar kartu 300
      padding: const EdgeInsets.all(20),      // jarak isi ke tepi 20 di semua sisi
      decoration: BoxDecoration(
        color: Colors.white,                  // warna kartu putih
        borderRadius: BorderRadius.circular(15),  // sudut membulat
        boxShadow: [                          // bayangan di sekeliling kartu
          BoxShadow(
            color: Colors.black26,            // warna bayangan (hitam transparan)
            blurRadius: 10,                   // tingkat keburaman bayangan
            offset: const Offset(0, 0.5),     // posisi bayangan (hampir tepat di bawah)
          ),
        ],
      ),
      child: Column(                          // isi kartu disusun ke bawah
        mainAxisSize: MainAxisSize.min,       // tinggi kolom secukupnya, tidak memenuhi layar
        children: [
          Container(                          // lingkaran untuk foto
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,         // bentuk lingkaran
              image: const DecorationImage(
                image: AssetImage('images/gea.jpg'),  // foto dari folder assets
                fit: BoxFit.cover,            // foto memenuhi lingkaran
              ),
              border: Border.all(color: Colors.teal, width: 3),  // garis tepi tosca tebal 3
            ),
          ),
          const SizedBox(height: 20),         // jarak foto ke nama
          const Text(
            'Gea Dwi Putri',                  // nama
            style: TextStyle(
              fontSize: 24,                   // ukuran huruf
              fontWeight: FontWeight.bold,    // tebal
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'seorang pembelajar yang mau belajar',  // deskripsi singkat
            textAlign: TextAlign.center,      // rata tengah
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Container(                          // kotak latar untuk daftar kontak
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),  // atas-bawah 10, kiri-kanan 20
            decoration: BoxDecoration(
              color: Colors.teal.withValues(alpha: 0.1),  // tosca sangat transparan (10%)
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                KontakInfoRow(icon: Icons.email, teks: 'gea@gmail.com'),          // baris email
                SizedBox(height: 10),
                KontakInfoRow(icon: Icons.phone, teks: '089999999'),              // baris telepon
                SizedBox(height: 10),
                KontakInfoRow(icon: Icons.location_on, teks: 'Bangka Belitung'),  // baris lokasi
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KontakInfoRow extends StatelessWidget {   // komponen satu baris kontak (dipakai 3 kali)
  final IconData icon;                          // data ikon yang diterima dari luar
  final String teks;                            // teks yang diterima dari luar

  const KontakInfoRow({super.key, required this.icon, required this.teks});  // keduanya wajib diisi

  @override
  Widget build(BuildContext context) {
    return Row(                                 // susun ke samping: ikon + teks
      children: [
        Icon(icon, size: 20, color: Colors.teal),  // tampilkan ikon
        const SizedBox(width: 10),                 // jarak ikon ke teks
        Expanded(                                  // teks mengambil sisa lebar
          child: Text(
            teks,
            overflow: TextOverflow.ellipsis,       // jika terlalu panjang, dipotong jadi "..."
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
```

**Catatan:**
- File ini tidak punya kode navigasi. Tombol kembali di AppBar muncul otomatis karena halaman dibuka dengan `Navigator.push`.
- `images/gea.jpg` hanya tampil jika folder `images/` terdaftar di `pubspec.yaml` dan filenya ada.

---

## 4) `kalkulator.dart`

Halaman tujuan Menu 2: kalkulator penjumlahan dua angka.

```dart
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {        // class perantara dari Menu 2
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const KalkulatorSederhana();      // langsung menampilkan kalkulator
  }
}

class KalkulatorSederhana extends StatefulWidget {   // Stateful karena hasil bisa berubah
  const KalkulatorSederhana({super.key});

  @override
  State<KalkulatorSederhana> createState() => _KalkulatorSederhanaState();  // membuat objek State-nya
}

class _KalkulatorSederhanaState extends State<KalkulatorSederhana> {   // tempat data dan logika (_ = private)
  final _formKey = GlobalKey<FormState>();   // kunci untuk mengontrol Form (dipakai untuk validasi)
  final TextEditingController _angka1Controller = TextEditingController();  // menyimpan teks Angka 1
  final TextEditingController _angka2Controller = TextEditingController();  // menyimpan teks Angka 2
  String hasil = '';                         // menyimpan hasil, awalnya kosong

  void _hitung() {                           // dijalankan saat "Proses Hitung" ditekan
    if (_formKey.currentState!.validate()) { // jalankan semua validator; true jika semua lolos
      double angka1 = double.parse(_angka1Controller.text);  // ubah teks Angka 1 jadi angka desimal
      double angka2 = double.parse(_angka2Controller.text);  // ubah teks Angka 2 jadi angka desimal
      double total = angka1 + angka2;        // proses penjumlahan

      setState(() {                          // beri tahu Flutter bahwa data berubah
        hasil = total.toString();            // simpan hasil sebagai teks
      });                                    // setelah ini build() dijalankan ulang, layar diperbarui
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,        // layar menyesuaikan saat keyboard muncul
      appBar: AppBar(
        title: const Text('Kalkulator Penjumlahan'),
      ),
      body: SingleChildScrollView(           // isi bisa digulir (agar tidak overflow saat keyboard muncul)
        child: Padding(
          padding: const EdgeInsets.all(16.0),  // jarak isi ke tepi layar 16
          child: Form(                       // pengelompok input yang bisa divalidasi
            key: _formKey,                   // menghubungkan Form dengan kunci di atas
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  // isi rata kiri
              children: [
                TextFormField(               // kolom input Angka 1
                  controller: _angka1Controller,          // teks yang diketik masuk ke controller ini
                  keyboardType: TextInputType.number,     // keyboard angka
                  decoration: const InputDecoration(
                    labelText: 'Angka 1',                 // label di kolom input
                  ),
                  validator: (value) {                    // aturan validasi
                    if (value == null || value.isEmpty) { // jika kosong
                      return 'Masukkan angka pertama';    // tampilkan pesan error
                    }
                    return null;                          // null = input valid
                  },
                ),
                const SizedBox(height: 10),   // jarak antar kolom
                TextFormField(               // kolom input Angka 2 (struktur sama)
                  controller: _angka2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Angka 2',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan angka kedua';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: _hitung,       // saat ditekan, jalankan fungsi _hitung
                    child: const Text('Proses Hitung'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Hasil penjumlahan: $hasil',   // $hasil menyisipkan isi variabel hasil ke teks
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // tutup halaman ini, kembali ke halaman sebelumnya
                    },
                    child: const Text('Back To Menu'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

**Catatan untuk presentasi:**
- Kedua `TextEditingController` dibuat tetapi tidak di-`dispose()`. Ini kekurangan kecil yang bisa menyebabkan kebocoran memori.
- Validator hanya memeriksa kolom kosong. Input seperti `-` atau `1.2.3` lolos validasi lalu membuat `double.parse` error.
