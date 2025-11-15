import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'au';
import 'package:flutter/material.dart';
import 'package:app_jeruk/src/HomePage.dart';

class Pagelogin extends StatefulWidget {
  const Pagelogin({super.key, required this.clientId});
  final String clientId;

  @override
  State<Pagelogin> createState() => _PageloginState();
}

class _PageloginState extends State<Pagelogin> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String _message = "";

  // LOGIN FUNCTION
  void _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

      setState(() {
        _message = "Login berhasil";
      });

      // Pindah ke HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } catch (e) {
      setState(() {
        _message = "Login gagal: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;

    final lebarContainer = lebar * 0.85;
    final tinggiContainer = tinggi * 0.45;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGO DAN JUDUL
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

              // FORM LOGIN
              Container(
                width: lebarContainer < 400 ? lebarContainer : 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 2),
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
                      "Masuk",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Masuk ke akun Anda untuk melanjutkan",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // EMAIL
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),

                    TextField(
                      controller: _emailcontroller,
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

                    // PASSWORD
                    const Text(
                      "Kata Sandi",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),

                    TextField(
                      controller: _passwordcontroller,
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
                    const SizedBox(height: 20),

                    // TOMBOL LOGIN
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 105, 68),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Masuk",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // PESAN LOGIN
                    Center(
                      child: Text(
                        _message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // LINK DAFTAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Belum punya akun?",
                            style: TextStyle(color: Colors.grey)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerPage');
                          },
                          child: const Text(
                            "Daftar sekarang",
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
