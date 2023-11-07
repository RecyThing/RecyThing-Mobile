import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/dashboard.dart';
import 'package:recything_mobile/screens/login/login_screen.dart';
import 'package:recything_mobile/screens/password_baru/password_baru_screen.dart';
import 'package:recything_mobile/screens/register/register_screen.dart';
import 'package:recything_mobile/screens/reset_password/reset_password_screen.dart';
import 'package:recything_mobile/screens/verifikasi_otp/verifikasi_otp_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Pallete.main),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verifikasi_otp': (context) => const VerifikasiOtpScreen(),
        '/password_baru': (context) => const PasswordBaruScreen(),
        '/dashboard': (context) => const Dasboard()
      },
    );
  }
}
