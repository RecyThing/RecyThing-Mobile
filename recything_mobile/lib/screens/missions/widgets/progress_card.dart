import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color backgroundColor;

  const ProgressCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 14, 22, 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.fromLTRB(28, 14, 22, 14),
          ),
          const SizedBox(
            width: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ThemeFont.heading6Bold,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                subTitle,
                style: ThemeFont.bodySmallRegular.copyWith(height: 1.7),
              )
            ],
          )
        ],
      ),
    );
  }
}
