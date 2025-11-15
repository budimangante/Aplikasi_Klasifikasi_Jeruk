import 'package:app_jeruk/firebase_options.dart';
import 'package:app_jeruk/src/HasilPredik.dart';
import 'package:app_jeruk/src/CameraPage.dart';
import 'package:app_jeruk/src/ManfaatJeruk.dart';
import 'package:app_jeruk/src/Panduanapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_jeruk/src/HomePage.dart';
import 'package:app_jeruk/src/pageLogin.dart';
import 'package:app_jeruk/src/registerPage.dart';
import 'package:app_jeruk/src/HasilPredik.dart';

const clientId = 'app-jeruk';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppJeruk());
}

class AppJeruk extends StatelessWidget {
  const AppJeruk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, 
      title: 'APP JERUK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.orange,
          secondary: Colors.deepOrange,
        ),
      ),
      
      initialRoute: '/',
      routes: {
        '/': (context) => const Pagelogin(clientId: 'app-jeruk'),
        '/registerPage': (context) => const RegisterPage(clientId: 'app-jeruk'),
        '/HomePage': (context) => MainPage(),
        '/Panduanapp': (context) => const PanduanPage(),
        '/CameraPage': (context) => const KlasifikasiPageUI(),
        '/ManfaatJeruk' : (context) => const ManfaatJerukPage(),
      },
    );
  }
}
