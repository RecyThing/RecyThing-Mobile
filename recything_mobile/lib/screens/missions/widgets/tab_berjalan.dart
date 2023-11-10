import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/mission_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TabBerjalan extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataBerjalan = [
    {
      'title': 'Tukarkan 2 kg\nSampah Logam',
      'progress': 50,
      'status': 'Tolong perbaiki bukti.',
      'tempColor': Pallete.error
    },
    {
      'title': 'Buang Sampah',
      'progress': 50,
      'status': 'Menunggu verifikasi',
      'tempColor': Pallete.infoLigther
    },
    {
      'title': 'Laporkan 3 Pelaku\nPelanggaran Sampah',
      'progress': 33,
      'status': 'Upload bukti pengerjaan',
      'tempColor': Pallete.dark3
    },
    {
      'title': 'Tukarkan 2 kg\nSampah Logam',
      'progress': 33,
      'status': 'Upload bukti pengerjaan',
      'tempColor': Pallete.dark3
    },
  ];

  TabBerjalan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: cardDataBerjalan.length,
              itemBuilder: (context, index) {
                var data = cardDataBerjalan[index];
                return Column(
                  children: [
                    MissionCard(
                      title: data['title'] ?? '-',
                      subTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              StepProgressIndicator(
                                totalSteps: 100,
                                currentStep: data['progress'],
                                size: 8,
                                padding: 0,
                                selectedColor: data['progress'] < 50
                                    ? Pallete.secondaryLigther
                                    : Pallete.mainLigther,
                                unselectedColor: const Color(0xFFC7C9D9),
                                roundedEdges: const Radius.circular(10),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                ('${data['progress'].toString()}%'),
                                style: ThemeFont.bodySmallRegular,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data['status'],
                            style: ThemeFont.bodySmallRegular
                                .copyWith(color: data['tempColor']),
                          )
                        ],
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
