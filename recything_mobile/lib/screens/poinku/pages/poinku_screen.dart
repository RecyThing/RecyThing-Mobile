import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_card.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_header.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_tabar.dart';

class PoinkuScreen extends StatefulWidget {
  const PoinkuScreen({super.key});

  @override
  State<PoinkuScreen> createState() => _PoinkuScreenState();
}

class _PoinkuScreenState extends State<PoinkuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 400,
              child: Stack(
                children: [
                  PoinkuHeader(),
                  Positioned(bottom: 0, child: PoinkuCard())
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const PoinkuTabar())
          ],
        ),
      ),
    );
  }
}
