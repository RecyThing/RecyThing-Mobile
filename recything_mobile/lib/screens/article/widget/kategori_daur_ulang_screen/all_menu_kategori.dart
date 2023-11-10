import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';

class AllMenuKategoriWidget extends StatelessWidget {
  AllMenuKategoriWidget({super.key});

  // Data list map
  final List<Map<String, String>> macamKategori = [
    {
      'imageAsset': 'assets/icons/icon_plastik_withText.png',
      'title': 'Plastik',
    },
    {
      'imageAsset': 'assets/icons/icon_kaca_withText.png',
      'title': 'Kaca',
    },
    {
      'imageAsset': 'assets/icons/icon_logam_withText.png',
      'title': 'Logam',
    },
    {
      'imageAsset': 'assets/icons/icon_organik_withText.png',
      'title': 'Organik',
    },
    {
      'imageAsset': 'assets/icons/icon_kertas_withText.png',
      'title': 'Kertas',
    },
    {
      'imageAsset': 'assets/icons/icon_kaleng_withText.png',
      'title': 'Kaleng',
    },
    {
      'imageAsset': 'assets/icons/icon_minyak_withText.png',
      'title': 'Minyak',
    },
    {
      'imageAsset': 'assets/icons/icon_elektronik_withText.png',
      'title': 'Elektronik',
    },
    {
      'imageAsset': 'assets/icons/icon_tekstil_withText.png',
      'title': 'Tekstil',
    },
    {
      'imageAsset': 'assets/icons/icon_pakaian_withText.png',
      'title': 'Pakaian',
    },
    {
      'imageAsset': 'assets/icons/icon_baterai_withText.png',
      'title': 'Baterai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: SizedBox(
        height: 494.33,
        width: 328,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: macamKategori.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // mainAxisSpacing: 10,
            // crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.59),
              child: SizedBox(
                width: 98.31,
                height: 99.58,
                child: Column(
                  children: [
                    Image.asset(
                      macamKategori[index]['imageAsset']!,
                      fit: BoxFit.cover,
                    ),
                    // const SizedBox(height: 9.66),
                    // SizedBox(
                    //   height: 19.66,
                    //   width: 98.31,
                    //   child: Text(
                    //     macamKategori[index]['title']!,
                    //     textAlign: TextAlign.center,
                    //     style: ThemeText().bodyNormalMedium,
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
