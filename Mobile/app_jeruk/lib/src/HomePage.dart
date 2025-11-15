import 'package:app_jeruk/main.dart';
import 'package:app_jeruk/src/CameraPage.dart';
import 'package:app_jeruk/src/ManfaatJeruk.dart';
import 'package:app_jeruk/src/Panduanapp.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HEADER ATAS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF6F3C), Color(0xFFFF8F5B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/orange.png",
                        width: 70,
                        height: 70,
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Jeruk Classifier",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Selamat datang!",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Aplikasi deteksi kualitas dan kecacatan jeruk menggunakan teknologi AI",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ===== MENU UTAMA =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Menu Utama",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _menuButton(
                    icon: Icons.camera_alt,
                    title: "Klasifikasi Jeruk",
                    subtitle: "Deteksi kecacatan pada jeruk",
                    borderColor: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KlasifikasiPageUI(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _menuButton(
                    icon: Icons.local_florist,
                    title: "Manfaat Jeruk",
                    subtitle: "Informasi gizi dan manfaat kesehatan",
                    borderColor: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ManfaatJerukPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _menuButton(
                    icon: Icons.menu_book,
                    title: "Panduan Penggunaan",
                    subtitle: "Cara menggunakan aplikasi",
                    borderColor: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PanduanPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Jenis Kecacatan yang Dapat Dideteksi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _defectCard(
                    label: "Baik",
                    desc: "Jeruk segar, kulit mulus, warna merata",
                    info:
                        "Jeruk dikatakan baik jika tidak memiliki bercak, jamur, atau kebusukan.",
                    imagePath: "assets/baik.jpg",
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _defectCard(
                    label: "Bercak",
                    desc: "Kulit jeruk memiliki noda kehitaman",
                    info:
                        "Bercak terjadi akibat gesekan atau serangga. Umumnya tidak membusuk tetapi mengurangi nilai jual.",
                    imagePath: "assets/bercak.jpg",
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _defectCard(
                    label: "Busuk",
                    desc: "Tekstur lembek & berair, bau tidak sedap",
                    info:
                        "Jeruk busuk terjadi karena infeksi bakteri atau jamur. Kulit rusak dan tekstur menjadi lembek.",
                    imagePath: "assets/busuk.jpg",
                    color: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  _defectCard(
                    label: "Jamur",
                    desc: "Muncul serabut putih atau kehijauan di kulit",
                    info:
                        "Jamur (Mold) umumnya tumbuh karena penyimpanan dalam kondisi lembap. Jeruk tidak layak konsumsi.",
                    imagePath: "assets/jamur.jpg",
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ==== MENU BUTTON ====
  Widget _menuButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: borderColor, size: 26),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


// ================= WIDGET: DEFECT CARD (Dipercantik) =================
Widget _defectCard({
  required String label,
  required String desc,
  required String info,
  required String imagePath,
  required Color color,
}) {
  return InkWell(
    onTap: () {
      // Pastikan navigatorKey dideklarasikan di main.dart
      showModalBottomSheet(
        context: navigatorKey.currentContext!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Judul dan Deskripsi Singkat yang Ditekankan
                Row(
                  children: [
                    Icon(Icons.circle, color: color, size: 14),
                    const SizedBox(width: 8),
                    Text(
                      label.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: color,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Deskripsi ringkas
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                      height: 1.4,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Ringkasan: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: desc,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 25, thickness: 1),

                // Gambar
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),

                // Deskripsi Detail (Penulisan Dipercantik)
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.orange.shade800,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Penjelasan Detail ($label):",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  info,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.6,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        },
      );
    },

    // Desain Kartu Ringkas
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Kiri: Gambar Ringkas
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),

          // Kanan: Teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, color: color, size: 10),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: color,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}
}