import 'package:flutter/material.dart';

class ManfaatJerukPage extends StatelessWidget {
  const ManfaatJerukPage({super.key});

  // Data Manfaat yang akan ditampilkan dalam bentuk Card/Tabel
  final List<Map<String, dynamic>> _manfaatList = const [
    {
      'icon': Icons.health_and_safety,
      'title': 'Tinggi Vitamin C',
      'description':
          'Meningkatkan sistem kekebalan tubuh, mempercepat penyembuhan luka, dan berperan sebagai antioksidan kuat melawan radikal bebas.',
    },
    {
      'icon': Icons.monitor_heart,
      'title': 'Menjaga Kesehatan Jantung',
      'description':
          'Kandungan serat, potasium, dan kolin membantu menjaga tekanan darah tetap stabil dan mengurangi risiko penyakit kardiovaskular.',
    },
    {
      'icon': Icons.healing,
      'title': 'Mendukung Sistem Pencernaan',
      'description':
          'Kandungan serat makanan (soluble dan insoluble) membantu pergerakan usus yang sehat, mencegah sembelit, dan mendukung bakteri usus baik.',
    },
    {
      'icon': Icons.remove_red_eye,
      'title': 'Baik untuk Penglihatan (Mata)',
      'description':
          'Sumber Karotenoid seperti Lutein dan Zeaxanthin lebih banyak pada Mandarin, yang penting untuk melindungi sel mata dari kerusakan degeneratif.',
    },
    {
      'icon': Icons.water_drop,
      'title': 'Hidrasi Tubuh',
      'description':
          'Kandungan air yang tinggi membuat buah jeruk sangat baik untuk menjaga tubuh tetap terhidrasi dan mengganti cairan yang hilang.',
    },
    {
      'icon': Icons.healing_outlined,
      'title': 'Kesehatan Kulit',
      'description':
          'Vitamin C adalah kunci untuk pembentukan kolagen, protein yang menjaga kulit tetap kencang, kenyal, dan mengurangi tanda penuaan.',
    },
    {
      'icon': Icons.sentiment_satisfied_alt,
      'title': 'Sumber Energi Alami',
      'description':
          'Mengandung gula alami yang menyediakan energi cepat tanpa lonjakan kadar gula darah yang ekstrem, ideal untuk aktivitas harian.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manfaat Jeruk Mandarin"), // Judul diubah
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Jeruk dari Asset
            Center(
              child: Image.asset(
                'assets/orange.png', // PASTIKAN GAMBAR ADALAH MANDARIN
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 20),

            // Judul yang Disesuaikan
            const Center(
              child: Text(
                "Keajaiban Sehat dari Jeruk Mandarin", // Judul disesuaikan
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepOrange, // Warna disesuaikan sedikit
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Deskripsi Singkat yang Disesuaikan
            const Text(
              "Jeruk Mandarin (Citrus reticulata) dikenal karena mudah dikupas dan memiliki rasa manis yang khas. Buah ini kaya akan senyawa bioaktif dan antioksidan yang bermanfaat bagi kesehatan secara keseluruhan.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            // INFO NUTRISI CEPAT (Quick Stats)
            const Text(
              "Nutrisi Utama (per 100g):",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),

            _buildQuickStats(),

            const SizedBox(height: 25),

            // Subjudul Daftar Manfaat Utama
            const Text(
              "Daftar Manfaat Utama:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),

            // Daftar Manfaat (menggunakan loop Map)
            ..._manfaatList.map((manfaat) {
              return _buildBenefitCard(
                icon: manfaat['icon'] as IconData,
                title: manfaat['title'] as String,
                description: manfaat['description'] as String,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  // ============== WIDGET HELPER: QUICK STATS ==============
  Widget _buildQuickStats() {
    // Data Nutrisi disesuaikan untuk Jeruk Mandarin (data riil per 100g)
    final List<Map<String, dynamic>> nutrisi = [
      {'value': '53', 'unit': 'kkal', 'label': 'Kalori'},
      {'value': '27', 'unit': 'mg', 'label': 'Vit. C'},
      {'value': '1.8', 'unit': 'g', 'label': 'Serat'},
      {'value': '10.6', 'unit': 'g', 'label': 'Gula'},
    ];

    return Row(
      // Menyebar kotak secara merata
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: nutrisi.map((item) {
        return Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.orange.shade200),
          ),
          child: Column(
            children: [
              Text(
                '${item['value']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              Text(
                item['unit'] + ' ' + item['label'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ============== WIDGET HELPER: BENEFIT CARD ==============
  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ikon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.deepOrange, size: 24),
            ),
            const SizedBox(width: 15),

            // Judul dan Deskripsi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
