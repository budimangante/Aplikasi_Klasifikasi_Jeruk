import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_jeruk/src/pageLogin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.clientId});
  final String clientId;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _message = "";

  void _register() async {
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      setState(() {
        _message = "Password dan konfirmasi tidak cocok";
      });
      return;
    }

    try {
      // Firebase REGISTER (email + password)
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      setState(() {
        _message = "Register Berhasil (${widget.clientId})";
      });

      // Setelah sukses → kembali ke login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Pagelogin(clientId: widget.clientId)),
      );
    } catch (e) {
      setState(() {
        _message = "Register gagal: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;

    final lebarContainer = lebar * 0.85;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // LOGO
              Column(
                children: [
                  Container(
                    width: lebar * 0.22,
                    height: lebar * 0.22,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_pizza,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Klasifikasi Kecacatan Jeruk",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Deteksi kualitas jeruk dengan AI",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                ],
              ),

              // FORM REGISTER
              Container(
                width: lebarContainer < 400 ? lebarContainer : 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daftar Akun",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Buat akun baru untuk melanjutkan",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // Nama
                    const Text(
                      "Nama",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        hintText: "Masukkan nama anda",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Email
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Masukkan email anda",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Password
                    const Text(
                      "Kata Sandi",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Masukkan kata sandi anda",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Confirm Password
                    const Text(
                      "Konfirmasi Kata Sandi",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Masukkan ulang kata sandi",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Pesan error
                    if (_message.isNotEmpty)
                      Center(
                        child: Text(
                          _message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                    const SizedBox(height: 20),

                    // Tombol Daftar
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            105,
                            68,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Daftar",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Punya akun? login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sudah punya akun?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Pagelogin(clientId: widget.clientId,)),
                            );
                          },
                          child: const Text(
                            "Masuk",
                            style: TextStyle(color: Colors.deepOrangeAccent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
