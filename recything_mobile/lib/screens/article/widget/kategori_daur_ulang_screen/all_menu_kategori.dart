import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';

class AllMenuKategoriWidget extends StatelessWidget {
  AllMenuKategoriWidget({super.key});

  // Data list map
  final List<Map<String, String>> macamKategori = [
    {
      'imageAsset': 'assets/icons/icon_plastik_noBg.png',
      'title': 'Plastik',
    },
    {
      'imageAsset': 'assets/icons/icon_kaca_noBg.png',
      'title': 'Kaca',
    },
    {
      'imageAsset': 'assets/icons/icon_logam_noBg.png',
      'title': 'Logam',
    },
    {
      'imageAsset': 'assets/icons/icon_organik_noBg.png',
      'title': 'Organik',
    },
    {
      'imageAsset': 'assets/icons/icon_kertas_noBg.png',
      'title': 'Kertas',
    },
    {
      'imageAsset': 'assets/icons/icon_kaleng_noBg.png',
      'title': 'Kaleng',
    },
    {
      'imageAsset': 'assets/icons/icon_minyak_noBg.png',
      'title': 'Minyak',
    },
    {
      'imageAsset': 'assets/icons/icon_elektronik_noBg.png',
      'title': 'Elektronik',
    },
    {
      'imageAsset': 'assets/icons/icon_tekstil_noBg.png',
      'title': 'Tekstil',
    },
    {
      'imageAsset': 'assets/icons/icon_pakaian_noBg.png',
      'title': 'Pakaian',
    },
    {
      'imageAsset': 'assets/icons/icon_baterai_noBg.png',
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
                    Container(
                      decoration: const BoxDecoration(),
                      height: 69.77,
                      width: 69.77,
                      child: Image.asset(
                        macamKategori[index]['imageAsset']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 9.66),
                    SizedBox(
                      height: 19.66,
                      width: 98.31,
                      child: Text(
                        macamKategori[index]['title']!,
                        textAlign: TextAlign.center,
                        style: ThemeText().bodyNormalMedium,
                      ),
                    )
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
