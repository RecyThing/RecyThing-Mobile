import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/theme/color_style.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Container(
        height: 56,
        width: 328,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ThemeColor().dark3Color,
            width: 1,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Container(
                height: 20.27,
                width: 20.26,
                padding: const EdgeInsets.only(right: 8, top: 2, left: 8),
                child: Image.asset("assets/icons/search.png"),
              ),
              hintText: "Cari disini...",
              hintStyle: ThemeText().bodySmallMedium,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
