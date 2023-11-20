import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ChooseReportCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String assetPath;
  final bool selected;
  const ChooseReportCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.assetPath,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: selected ? Pallete.light3 : Pallete.dark3),
        borderRadius: BorderRadius.circular(12),
        color: selected ? Pallete.main : Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  assetPath,
                  color: selected ? Pallete.light3 : Pallete.dark3,
                ),
              ),
              const SizedBox(width: 12),
              Image.asset(
                "assets/images/faq_icon.png",
                color: selected ? Pallete.light3 : Pallete.dark3,
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 33),
          Divider(
            color: selected ? Pallete.light3 : Pallete.dark3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: ThemeFont.bodyMediumBold.copyWith(
                    color: selected ? Pallete.light3 : Pallete.dark3)),
          ),
          Divider(
            color: selected ? Pallete.light3 : Pallete.dark3,
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: ThemeFont.bodySmallRegular
                .copyWith(color: selected ? Pallete.light3 : Pallete.dark3),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}