import 'package:flutter/material.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= HEADER ===================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 25),
              decoration: const BoxDecoration(
                color: Color(0xFF3279FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          "Kembali",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Panduan Penggunaan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Cara menggunakan aplikasi klasifikasi jeruk",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= LANGKAH PENGGUNAAN ===================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Langkah-Langkah Penggunaan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            _langkahCard(
              icon: Icons.touch_app,
              title: "Pilih Menu Klasifikasi",
              desc:
                  "Dari menu utama, pilih “Klasifikasi Jeruk” untuk memulai proses deteksi kecacatan.",
            ),

            _langkahCard(
              icon: Icons.camera_alt,
              title: "Ambil atau Unggah Foto",
              desc:
                  "Gunakan kamera untuk mengambil foto jeruk secara langsung, atau pilih foto dari galeri Anda.",
            ),

            _langkahCard(
              icon: Icons.settings,
              title: "Analisis Otomatis",
              desc:
                  "Sistem akan menganalisis foto jeruk dan mendeteksi kemungkinan jenis kecacatan secara otomatis.",
            ),

            _langkahCard(
              icon: Icons.check_circle,
              title: "Lihat Hasil",
              desc:
                  "Hasil klasifikasi akan ditampilkan dengan tingkat kepercayaan untuk setiap kategori kecacatan.",
            ),

            const SizedBox(height: 25),

            // ================= FAQ ===================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Pertanyaan Umum",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            _faqItem(
              "Bagaimana cara mengambil foto yang baik?",
              "Pastikan jeruk terlihat jelas, fokus, dan pencahayaan cukup.",
            ),

            _faqItem(
              "Apa saja jenis kecacatan yang dapat dideteksi?",
              "Aplikasi dapat mendeteksi busuk, bercak, jamur, dan kondisi baik.",
            ),

            _faqItem(
              "Apakah hasil deteksi selalu akurat?",
              "Akurasi tinggi namun tetap bisa berubah tergantung kualitas foto.",
            ),

            _faqItem(
              "Bagaimana jika hasil tidak sesuai?",
              "Coba ambil foto dengan cahaya lebih baik atau posisi lebih jelas.",
            ),

            const SizedBox(height: 25),

            // ================= TIPS ===================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Tips untuk Hasil Terbaik",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            _tipsCard(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= WIDGET LANGKAH CARD ===================
  Widget _langkahCard({required IconData icon, required String title, required String desc}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= WIDGET FAQ ITEM ===================
  Widget _faqItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ExpansionTile(
        iconColor: Colors.blue,
        collapsedIconColor: Colors.grey,
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              content,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),
          )
        ],
      ),
    );
  }

  // ================= WIDGET TIPS CARD ===================
  Widget _tipsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _tipsItem("Gunakan latar belakang polos dan kontras"),
            _tipsItem("Ambil foto dari jarak ideal dan stabil"),
            _tipsItem("Pastikan warna bagian jeruk terlihat jelas"),
            _tipsItem("Hindari refleksi cahaya yang berlebihan"),
          ],
        ),
      ),
    );
  }
}

// ================= WIDGET TIPS ITEM ===================
class _tipsItem extends StatelessWidget {
  final String text;
  const _tipsItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 18),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
