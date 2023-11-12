import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class LencanaCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String angka;
  const LencanaCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.angka});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/$image.png",
              ),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ThemeFont.bodyMediumBold
                .copyWith(color: Pallete.textMainButton),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 14),
            child: Text(
              subtitle,
              style: ThemeFont.bodySmallRegular
                  .copyWith(color: Pallete.light4.withOpacity(0.6)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Poin Dibutuhkan",
                style: ThemeFont.bodySmallRegular
                    .copyWith(color: Pallete.textMainButton),
              ),
              Text(
                "$angka Poin",
                style: ThemeFont.bodyMediumBold
                    .copyWith(color: Pallete.textMainButton),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
