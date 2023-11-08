import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/dashboard.dart';
import 'package:recything_mobile/screens/home/pages/notifikasi_screen.dart';
import 'package:recything_mobile/screens/home/pages/profile_screen.dart';
import 'package:recything_mobile/screens/login/login_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/poinku_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.textMainButton,
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(seedColor: Pallete.main),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const Dasboard(),
        '/profile': (context) => const ProfileScreen(),
        '/notif': (context) => const NotifikasiScreen(),
        '/poinku': (context) => const PoinkuScreen()
      },
    );
  }
}
