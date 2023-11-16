import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class TextFieldReport extends StatelessWidget {
  final String hinttext;
  final int? maxLines;
  final Color? focusColor;
  final TextStyle? labelStyle;
  final String? label;
  final IconData? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const TextFieldReport({
    Key? key,
    required this.hinttext,
    this.maxLines,
    this.focusColor,
    this.labelStyle,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.label,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: focusColor ?? Pallete.main),
        ),
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Pallete.dark3) : null,
        hintText: hinttext,
        hintStyle: labelStyle ?? const TextStyle(color: Pallete.dark3),
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
      ),
      style: const TextStyle(
        backgroundColor: Colors.white,
      ),
      maxLines: maxLines,
    );
  }
}
