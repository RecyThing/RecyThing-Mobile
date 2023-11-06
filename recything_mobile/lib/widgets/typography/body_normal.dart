import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class BodyNormal extends StatelessWidget {
  final String text;
  const BodyNormal(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Pallete.textSecondary,
        height: 1.8,
      ),
    );
  }
}
