import 'dart:io'; //File
import 'dart:async'; //TimeoutException
import 'dart:convert';//jsonDecode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:app_jeruk/src/HasilPredik.dart';
import 'package:app_jeruk/src/HomePage.dart';

class KlasifikasiPageUI extends StatefulWidget {
  const KlasifikasiPageUI({super.key});

  @override
  State<KlasifikasiPageUI> createState() => _KlasifikasiPageUIState();
}

class _KlasifikasiPageUIState extends State<KlasifikasiPageUI> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  final String apiUrl = 'https://ambient-quarterly-switches-professionals.trycloudflare.com/api/predict-image';

  Future<void> predictImage(File imageFile) async {
    setState(() => _isLoading = true);
    
    try {
      final uri = Uri.parse(apiUrl);
      final request = http.MultipartRequest('POST', uri);
      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );
      
      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw TimeoutException('Koneksi timeout, coba lagi');
        },
      );

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final hasilPrediksi = data['prediction'].toString();
        final detailHasil = Map<String, double>.from(
          data['confidence'].map((key, value) => MapEntry(
            key, 
            value.toDouble()
          ))
        );

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Hasilpredik(
                imageFile: imageFile,
                hasilPrediksi: hasilPrediksi,
                detailHasil: detailHasil,
              ),
            ),
          );
        }
      } else {
        showError("Gagal memproses gambar (${response.statusCode})");
      }
    } on TimeoutException catch (e) {
      showError("Koneksi timeout: ${e.message}"); 
    } catch (e) {
      showError("Terjadi kesalahan: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void ambilFoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    final imageFile = File(pickedFile.path);

    if (!mounted) return;
    setState(() => _image = imageFile);

    await predictImage(imageFile);
  }

  void galeriFoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    final imageFile = File(pickedFile.path);

    if (!mounted) return;
    setState(() => _image = imageFile);

    await predictImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6A00), Color(0xFFFF8A00)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MainPage()),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white),
                          SizedBox(width: 10),
                          Text("Kembali", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Klasifikasi Jeruk",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Deteksi kecacatan pada jeruk",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // CARD FOTO
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    if (_image == null)
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.orange.shade100,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.orange,
                          size: 40,
                        ),
                      )
                    else
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _image!,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 15),
                    const Text(
                      "Ambil atau Pilih Foto Jeruk",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Upload foto jeruk untuk memulai klasifikasi",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // AMBIL FOTO
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : ambilFoto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isLoading ? Colors.grey : Colors.white,
                          side: BorderSide(color: _isLoading ? Colors.grey : Colors.orange),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_camera, color: _isLoading ? Colors.grey : Colors.orange),
                            const SizedBox(width: 10),
                            Text(
                              "Ambil Foto",
                              style: TextStyle(color: _isLoading ? Colors.grey : Colors.orange),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // PILIH GALERI
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: _isLoading ? null : galeriFoto,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: _isLoading ? Colors.grey : Colors.orange),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload, color: _isLoading ? Colors.grey : Colors.orange),
                            const SizedBox(width: 10),
                            Text(
                              "Pilih dari Galeri",
                              style: TextStyle(color: _isLoading ? Colors.grey : Colors.orange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              
              // TIPS
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          "Tips Mengambil Foto",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("• Pastikan pencahayaan cukup"),
                    Text("• Fokuskan pada satu jeruk"),
                    Text("• Gunakan latar belakang polos"),
                  ],
                ),
              ),
            ],
          ),
          
          // ============================================
          // LOADING OVERLAY (INI YANG BARU!)
          // ============================================
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Spinning Orange
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Icon Jeruk (opsional, pakai emoji)
                      const Text(
                        "🍊",
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 15),
                      // Text Loading
                      const Text(
                        "Menganalisis Jeruk...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Mohon tunggu sebentar",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}