import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/mission_card.dart';

class TabTersedia extends StatelessWidget {
  final cardDataTersedia = [
    {
      'title': 'Tukarkan 1 kg\nsampah',
      'subTitle': 'Dapatkan 100 poin pertamamu!'
    },
    {
      'title': 'Laporkan 3 pelaku\nPelanggaran sampah',
      'subTitle': 'Dapatkan 300 poin!'
    },
    {
      'title': 'Lingkungan yang\nlebih bersih!',
      'subTitle': 'Dapatkan 500 poin!'
    },
    {'title': 'Tukarkan 2 kg\nSampah Logam', 'subTitle': 'Dapatkan 5000 poin!'}
  ];

  TabTersedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Pilihan Misi yang Tersedia",
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Pallete.dark3)),
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: cardDataTersedia.length,
              itemBuilder: (context, index) {
                var data = cardDataTersedia[index];
                return Column(
                  children: [
                    MissionCard(
                      title: data['title'] ?? '-',
                      subTitle: Text(
                        data['subTitle'] ?? '-',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
