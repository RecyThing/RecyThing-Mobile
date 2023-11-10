import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/dashboard.dart';
import 'package:recything_mobile/screens/login/login_screen.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Pallete.main),
        useMaterial3: true,
      ),
      initialRoute: '/missions',
      routes: {
        '/missions': (context) => const MissionsScreen(),
        '/detail-mission': (context) => const DetailMission(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const Dasboard()
      },
    );
  }
}
