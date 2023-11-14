import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/page/kategori_daur_ulang_screen.dart';
import 'package:recything_mobile/screens/dashboard.dart';
import 'package:recything_mobile/screens/home/pages/notifikasi_screen.dart';
import 'package:recything_mobile/screens/home/pages/profile_screen.dart';
import 'package:recything_mobile/screens/login/login_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/detail_transaksi_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/detail_voucher_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/poinku_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/tukar_voucher_screen.dart';
import 'package:recything_mobile/screens/onboarding/onboarding_screen.dart';
import 'package:recything_mobile/screens/password_baru/password_baru_screen.dart';
import 'package:recything_mobile/screens/register/register_screen.dart';
import 'package:recything_mobile/screens/report/choose_report_screen.dart';
import 'package:recything_mobile/screens/report/detail_riwayat_pelaporan_screen.dart';
import 'package:recything_mobile/screens/report/report_rubbish_maps_screen.dart';
import 'package:recything_mobile/screens/reset_password/reset_password_screen.dart';
import 'package:recything_mobile/screens/splash/splash_screen.dart';
import 'package:recything_mobile/screens/verifikasi_otp/verifikasi_otp_screen.dart';
import 'package:recything_mobile/screens/report/report_rubbish_screen.dart';
import 'package:recything_mobile/screens/missions/detail_mission_screen.dart';
import 'package:recything_mobile/screens/missions/missions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.textMainButton,
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(seedColor: Pallete.main),
        useMaterial3: true,
      ),
      initialRoute: '/report-rubbish-maps',
      routes: {
        // '/splash': (context) => const SplashScreen(),
        // '/onboarding': (context) => const OnboardingScreen(),
        // '/missions': (context) => const MissionsScreen(),
        // '/detail-mission': (context) => const DetailMission(),
        // '/login': (context) => const LoginScreen(),
        // '/dashboard': (context) => const Dasboard(),
        // '/profile': (context) => const ProfileScreen(),
        // '/notif': (context) => const NotifikasiScreen(),
        // '/poinku': (context) => const PoinkuScreen(),
        // '/detailVoucher': (context) => const DetailVoucherScreen(),
        // '/tukarVoucher': (context) => const TukatVoucherScreen(),
        // '/detailTransaksi': (context) => const DetailTransaksiScreen(),
        // '/register': (context) => const RegisterScreen(),
        // '/reset_password': (context) => const ResetPasswordScreen(),
        // '/verifikasi_otp': (context) => const VerifikasiOtpScreen(),
        // '/password_baru': (context) => const PasswordBaruScreen(),
        '/choose-report': (context) => const ChooseReportScreen(),
        '/report-rubbish': (context) => const ReportRubbishScreen(),
        '/report-rubbish-maps': (context) => const ReportRubbishMapsScreen(),
        '/detail-report': (context) => const DetailRiwayatPelaporanScreen(),
        // '/kategoriDaurUlang': (context) => const KategoriDaurUlangPage()
      },
    );
  }
}
