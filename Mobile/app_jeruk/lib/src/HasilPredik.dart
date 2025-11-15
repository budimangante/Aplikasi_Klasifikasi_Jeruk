import 'package:flutter/material.dart';
import 'dart:io';

class Hasilpredik extends StatelessWidget {
  final File imageFile;
  final String hasilPrediksi;
  final Map<String, double>? detailHasil;

  const Hasilpredik({
    super.key,
    required this.imageFile,
    required this.hasilPrediksi,
    this.detailHasil,
  });

  Color _getStatusColor(double percentage) {
    if (percentage >= 70) return Colors.green;
    if (percentage >= 50) return Colors.orange;
    return Colors.red;
  }

  String _getStatusText(double percentage) {
    if (percentage >= 70) return 'Jeruk dalam kondisi normal';
    if (percentage >= 50) return 'Jeruk dalam kondisi sedang';
    return 'Jeruk dalam kondisi buruk';
  }

  @override
  Widget build(BuildContext context) {
    // Data asli dari API
    Map<String, double> details = detailHasil ?? {};

    // ambil probability kelas utama
    double mainPercentage = details[hasilPrediksi] ?? 0.0;

    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        title: const Text(
          "Hasil Klasifikasi",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // GAMBAR
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // HASIL UTAMA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _getStatusColor(mainPercentage).withOpacity(0.4),
                  width: 2,
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hasilPrediksi,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(mainPercentage),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${mainPercentage.toStringAsFixed(1)}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    _getStatusText(mainPercentage),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 18),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: mainPercentage / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation(
                        _getStatusColor(mainPercentage),
                      ),
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // DETAIL TITLE
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Detail Hasil",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // LIST PROBABILITY
            ...details.entries.map((entry) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAMA + PERSENTASE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${entry.value.toStringAsFixed(1)}%",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: entry.value / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation(
                          entry.key == hasilPrediksi
                              ? Colors.green
                              : Colors.grey.shade500,
                        ),
                        minHeight: 7,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
