import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class TextFieldReport extends StatelessWidget {
  final String hinttext;
  final int? maxLines;
  final Color? focusColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  const TextFieldReport({
    Key? key,
    required this.hinttext,
    this.maxLines,
    this.focusColor,
    this.labelStyle,
    this.contentPadding,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: focusColor ?? Pallete.main),
        ),
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
