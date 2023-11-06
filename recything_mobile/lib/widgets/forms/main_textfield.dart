import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class MainTextField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  const MainTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusColor: Pallete.dark1,
        labelStyle: const TextStyle(color: Pallete.dark2),
        label: Text(label),
        // hintText: "Masukan Email / No HP",
        prefixIcon: Icon(
          prefixIcon,
          color: Pallete.dark2,
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      style: const TextStyle(
        backgroundColor: Colors.white,
      ),
    );
  }
}
