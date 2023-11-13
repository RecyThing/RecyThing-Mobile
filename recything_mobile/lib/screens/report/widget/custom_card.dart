import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String assetImage;
  final Color cardColor;
  const CustomCard(
      {super.key,
      required this.title,
      required this.description,
      required this.assetImage,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 88,
                width: 88,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  assetImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ThemeFont.bodyNormal,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Pallete.dark3,
                      fontSize: ThemeFont.bodySmall.fontSize,
                      fontWeight: ThemeFont.bodySmall.fontWeight,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, bottom: 48, right: 16),
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallete.mainDarker,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
