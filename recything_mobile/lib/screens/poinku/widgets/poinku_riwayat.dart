import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class PoinkuRiwayat extends StatelessWidget {
  const PoinkuRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Pallete.secondaryLigther.withOpacity(0.5),
            shape: BoxShape.circle),
        child: Image.asset(
          "assets/icons/profile/poinku.png",
          width: 24,
          color: Pallete.secondary,
        ),
      ),
      title: Text(
        "Hadiah Mission",
        style: ThemeFont.interText.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text("20 Oktober 2023 | 14.21"),
      trailing: Text(
        "+18.000",
        style: ThemeFont.interText.copyWith(
            fontSize: 16, fontWeight: FontWeight.bold, color: Pallete.main),
      ),
    );
  }
}
