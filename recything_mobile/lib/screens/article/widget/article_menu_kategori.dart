import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';
import 'package:recything_mobile/screens/article/widget/article_button_kategori_daur_ulang.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

class MenuKategoriWidget extends StatelessWidget {
  const MenuKategoriWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: SizedBox(
        height: 132,
        width: 328,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kategori Daur Ulang",
                  style: ThemeText().heading6Medium,
                ),
                const BodyLink("Lihat semua")
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                ButtonKategoriDaurUlang(
                  assetImage: 'assets/icons/icon_plastik.png',
                  title: 'Plastik',
                ),
                SizedBox(width: 27),
                ButtonKategoriDaurUlang(
                  assetImage: 'assets/icons/icon_kaca.png',
                  title: 'Kaca',
                ),
                SizedBox(width: 27),
                ButtonKategoriDaurUlang(
                  assetImage: 'assets/icons/icon_logam.png',
                  title: 'Logam',
                ),
                SizedBox(width: 27),
                ButtonKategoriDaurUlang(
                  assetImage: 'assets/icons/icon_organik.png',
                  title: 'Organik',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
