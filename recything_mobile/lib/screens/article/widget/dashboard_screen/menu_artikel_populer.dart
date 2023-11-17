import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';
import 'package:recything_mobile/screens/article/widget/list_artikel.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

class MenuArticlePopular extends StatelessWidget {
  const MenuArticlePopular({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: SizedBox(
        height: 408,
        // width: 328,
        child: Column(
          children: [
            SizedBox(
              height: 24,
              // width: 328,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Artikel Populer',
                    style: ThemeText().heading6Medium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cariArtikel');
                    },
                    child: const BodyLink('Lihat Semua'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Expanded(child: ListArtikelWidget())
          ],
        ),
      ),
    );
  }
}
