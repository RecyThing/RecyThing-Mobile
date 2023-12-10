import 'package:flutter/material.dart';
import 'package:recything_mobile/models/user_model.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_card.dart';
import 'package:recything_mobile/widgets/forms/custom_app_bar.dart.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_tabar.dart';

class PoinkuScreen extends StatefulWidget {
  final UserModel user;
  const PoinkuScreen({super.key, required this.user});

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
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  CustomAppBar(
                    title: "Poinku",
                    onTap: () => Navigator.pushNamed(context, '/dashboard'),
                  ),
                  Positioned(
                      bottom: 0,
                      child: PoinkuCard(
                        user: widget.user,
                      ))
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
