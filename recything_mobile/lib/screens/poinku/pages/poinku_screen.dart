import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_card.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_header.dart';

class PoinkuScreen extends StatefulWidget {
  const PoinkuScreen({super.key});

  @override
  State<PoinkuScreen> createState() => _PoinkuScreenState();
}

class _PoinkuScreenState extends State<PoinkuScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  PoinkuHeader(),
                  Positioned(bottom: 0, child: PoinkuCard())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
