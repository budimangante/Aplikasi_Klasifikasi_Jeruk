===================================================================== APLIKASI KLASIFIKASI KECACATAN JERUK ============================================================

A. Definisi Aplikasi:
Aplikasi ini merupakan aplikasi yang dibuat untuk membantu petani atau pembeli dalam memilih serta mengelompokkan tingkat kecacatan pada buah jeruk mandarin. Dengan menggunakan fitur klasifikasi jeruk, pengguna cukup melakukan pemindaian (scan) pada gambar jeruk, dan aplikasi akan menampilkan persentase kemungkinan kondisi jeruk tersebut, apakah tergolong baik atau memiliki kecacatan tertentu.
=======================================================================================================================================================================
B. Penggunaan APP:
1. Pilih Menu Klasifikasi
Dari menu utama aplikasi, pilih fitur “Klasifikasi Jeruk” untuk memulai proses pendeteksian kecacatan.

2. Ambil atau Unggah Foto
Pengguna dapat mengambil foto jeruk secara langsung menggunakan kamera, atau mengunggah foto dari galeri perangkat.

3. Analisis Otomatis
Setelah foto dipilih, sistem akan melakukan analisis otomatis untuk mendeteksi jenis kecacatan jeruk berdasarkan model klasifikasi.

4. Lihat Hasil
Aplikasi akan menampilkan hasil klasifikasi berupa persentase tingkat kepercayaan (confidence) untuk setiap kategori kecacatan, seperti: baik, bercak, busuk, atau jamur.

5. Tips Agar Hasil Lebih Akurat:
   - Gunakan latar belakang polos yang kontras.
   - Ambil foto dari jarak yang ideal dan stabil.
   - Pastikan warna permukaan jeruk terlihat jelas.
   - Hindari cahaya berlebihan atau pantulan.
6. Adapun Manfaat jeruk, ini memberitahu apa aja manfaat yang ada pada jeruk
=======================================================================================================================================================================
C. Cara Mengaktifkan API:

Install Miniconda melalui link: https://www.anaconda.com/download
B. Cara mengaktifkan API:
1. Install miniconda pada link: https://www.anaconda.com/download
2. Setelah terinstall buka cmd lalu bikin environment dengan : conda env create -n apijeruk -f environment.yml
3. Aktifkan Environment dengan: "conda activate apijeruk" pada visual studio code
4. lalu jalankan server di path Synapse dengan: python manage.py runserver
5. Jika berhasil maka akan muncul: "November 15, 2025 - 16:17:56
Django version 5.1.2, using settings 'synapse.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK."
=======================================================================================================================================================================
D. Cara Aktifkan Local Tunnel:
1. pastikan sudah menginstall nodejs jika belum silahkan install pada link: https://nodejs.org/en/download
2. Install Localtunnel pada link: https://theboroer.github.io/localtunnel-www/ aktifkan pada cmd dengan: npm install -g localtunnel
3. lalu cek versi dari localtunel dengan: lt --version
4. jika sudah terinstall bikin subdomain bernama appjeruk dengan lt --port 8000 --subdomain appjeruk
5. gunakan subdomain yang muncul pada url

yup cara ini untuk melakukan pengaktifan pada API appjeruk ini.

