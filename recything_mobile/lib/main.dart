import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/auth/auth_cubit.dart';
import 'package:recything_mobile/bloc/forgot_password/forgot_password_cubit.dart';
import 'package:recything_mobile/bloc/get_ai/get_ai_cubit.dart';
import 'package:recything_mobile/bloc/get_history_report_by_id/get_history_report_by_id_cubit.dart';
import 'package:recything_mobile/bloc/get_report_hisstory/get_report_history_cubit.dart';
import 'package:recything_mobile/bloc/get_user_profile/get_user_profile_cubit.dart';
import 'package:recything_mobile/bloc/login/login_cubit.dart';
import 'package:recything_mobile/bloc/get_all_faq/get_all_faq_cubit.dart';
import 'package:recything_mobile/bloc/update_user_profile/update_user_profile_cubit.dart';
import 'package:recything_mobile/bloc/register/register_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/page/artikel_by_kategori.dart';
import 'package:recything_mobile/screens/article/page/cari_artikel.dart';
import 'package:recything_mobile/screens/article/page/daftar_lokasi.dart';
import 'package:recything_mobile/screens/article/page/detail_artikel.dart';
import 'package:recything_mobile/screens/article/page/detail_lokasi.dart';
import 'package:recything_mobile/screens/article/page/kategori_daur_ulang_screen.dart';
import 'package:recything_mobile/screens/dashboard.dart';
import 'package:recything_mobile/screens/home/pages/notifikasi_screen.dart';
import 'package:recything_mobile/screens/home/pages/pertanyaan_umum_screen.dart';
import 'package:recything_mobile/screens/home/pages/profile_screen.dart';
import 'package:recything_mobile/screens/home/pages/ubah_password_screen.dart';
import 'package:recything_mobile/screens/index_screen.dart';
import 'package:recything_mobile/screens/lencana/pages/lencana_screen.dart';
import 'package:recything_mobile/screens/login/login_screen.dart';
import 'package:recything_mobile/screens/missions/detail_mission_screen.dart';
import 'package:recything_mobile/screens/missions/missions_screen.dart';
import 'package:recything_mobile/screens/missions/unggah_bukti_screen.dart';
import 'package:recything_mobile/screens/onboarding/onboarding_screen.dart';
import 'package:recything_mobile/screens/password_baru/password_baru_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/detail_transaksi_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/detail_voucher_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/poinku_screen.dart';
import 'package:recything_mobile/screens/poinku/pages/tukar_voucher_screen.dart';
import 'package:recything_mobile/screens/recy/pages/recy_ai_screen.dart';
import 'package:recything_mobile/screens/register/register_screen.dart';
import 'package:recything_mobile/screens/report/choose_report_screen.dart';
import 'package:recything_mobile/screens/report/report-rubbish/detail_riwayat_pelaporan_screen.dart';
import 'package:recything_mobile/screens/report/report-rubbish/report_rubbish_screen.dart';
import 'package:recything_mobile/screens/report/widget/maps_report_screen.dart';
import 'package:recything_mobile/screens/report/report_littering/report_littering_screen.dart';
import 'package:recything_mobile/screens/reset_password/reset_password_screen.dart';
import 'package:recything_mobile/screens/splash/splash_screen.dart';
import 'package:recything_mobile/screens/verifikasi_otp/verifikasi_otp_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()..appStarted()),
        BlocProvider(create: (_) => GetAiCubit()),
        BlocProvider(create: (_) => GetAllFaqCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (_) => GetUserProfileCubit()),
        BlocProvider(create: (_) => UpdateUserProfileCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ForgotPasswordCubit()),
        BlocProvider(create: (_) => GetReportHistoryCubit()),
        BlocProvider(create: (_) => GetHistoryReportByIdCubit())
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Pallete.textMainButton,
          fontFamily: "Inter",
          colorScheme: ColorScheme.fromSeed(seedColor: Pallete.main),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
        // home: const IndexScreen(),
        routes: {
          '/index': (context) => const IndexScreen(),
          '/splash': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/missions': (context) => const MissionsScreen(),
          '/detail-mission': (context) => const DetailMissionScreen(),
          '/unggah-bukti': (context) => const UnggahBuktiScreen(),
          '/login': (context) => const LoginScreen(),
          '/dashboard': (context) => const Dasboard(),
          '/profile': (context) => const ProfileScreen(),
          '/notif': (context) => const NotifikasiScreen(),
          '/poinku': (context) => const PoinkuScreen(),
          '/detailVoucher': (context) => const DetailVoucherScreen(),
          '/tukarVoucher': (context) => const TukatVoucherScreen(),
          '/detailTransaksi': (context) => const DetailTransaksiScreen(),
          '/register': (context) => const RegisterScreen(),
          '/reset_password': (context) => const ResetPasswordScreen(),
          '/verifikasi_otp': (context) => const VerifikasiOtpScreen(),
          '/password_baru': (context) => const PasswordBaruScreen(),
          // '/editProfile': (context) => const EditProfileScreen(),
          '/pertanyaanUmum': (context) => const PertanyaanUmumScren(),
          '/lencana': (context) => const LencanaScreen(),
          '/ubahPassword': (context) => const UbahPasswordScreen(),
          '/recy': (context) => const RecyAiScreen(),
          '/choose-report': (context) => const ChooseReportScreen(),
          '/report-rubbish': (context) => const ReportRubbishScreen(),
          '/report-littering': (context) => const ReportLitteringScreen(),
          '/detail-report': (context) => const DetailRiwayatPelaporanScreen(),
          '/maps-report': (context) => const MapsReportScreen(reportType: ''),
          '/artikelByKategori': (context) => const ArtikelByKategoriScreen(),
          '/kategoriDaurUlang': (context) => const KategoriDaurUlangScreen(),
          '/cariArtikel': (context) => const CariArtikelScreen(),
          '/daftarLokasi': (context) => const DaftarLokasiScreen(),
          '/detailLokasi': (context) => const DetailLokasiScreen(),
          '/detailArtikel': (context) => const DetailArtikelScreen(),
        },
      ),
    );
  }
}
