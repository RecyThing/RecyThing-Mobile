import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/screens/article/theme/color_style.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;
  final FocusNode? focusNode;

  SearchBarWidget({
    super.key,
    required this.onChanged,
    required this.onTap,
    required this.readOnly,
    required this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColor().dark3Color,
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(IconlyLight.search),
            hintText: "Cari disini...",
            hintStyle: ThemeText().bodySmallMedium,
            border: InputBorder.none),
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        focusNode: focusNode,
      ),
    );
  }
}
