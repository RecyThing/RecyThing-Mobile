import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class MainTextField extends StatefulWidget {
  final String label;
  final IconData? prefixIcon;
  final bool obscureText;
  final void Function()? onTap;
  final bool? enabled;
  final Widget? suffixIcon;
  const MainTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.obscureText = false,
    this.onTap,
    this.enabled = true,
    this.suffixIcon,
  });

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: widget.onTap,
      enabled: widget.enabled,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallete.info),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusColor: Pallete.info,
        labelStyle: TextStyle(color: _isFocused ? Pallete.info : Pallete.dark3),
        label: Text(widget.label),
        suffixIcon: widget.suffixIcon,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Pallete.dark3,
        ),
        contentPadding: const EdgeInsets.all(18),
      ),
      style: ThemeFont.bodySmall,
    );
  }
}
