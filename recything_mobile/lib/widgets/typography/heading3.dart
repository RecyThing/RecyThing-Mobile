import 'package:flutter/material.dart';

class Heading3 extends StatelessWidget {
  final String text;
  const Heading3(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
    );
  }
}
