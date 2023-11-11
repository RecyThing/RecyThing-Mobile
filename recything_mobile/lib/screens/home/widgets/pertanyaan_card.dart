import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class PertanyaanCard extends StatefulWidget {
  const PertanyaanCard({super.key});

  @override
  State<PertanyaanCard> createState() => _PertanyaanCardState();
}

class _PertanyaanCardState extends State<PertanyaanCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Cara mengelola sampah',
        style: ThemeFont.bodyNormalSemiBold,
      ),
      tilePadding: EdgeInsets.zero,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Cara mengelola sampah Cara mengelola sampah dapat melibatkan beberapa langkah, termasuk aaaaaaaaaaa",
                style: ThemeFont.bodySmallRegular,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Selengkapnya",
                  style:
                      ThemeFont.bodySmallSemiBold.copyWith(color: Pallete.main),
                ))
          ],
        ),
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {});
      },
    );
  }
}
