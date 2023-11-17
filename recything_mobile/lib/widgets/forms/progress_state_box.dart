import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ProgressStateBox extends StatelessWidget {
  final Widget child;

  const ProgressStateBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: Pallete.successLigther,
          borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: child,
      ),
    );
  }
}
