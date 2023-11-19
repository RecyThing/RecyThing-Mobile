import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/screens/article/theme/color_style.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

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
      ),
    );
  }
}
