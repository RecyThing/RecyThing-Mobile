import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/mission_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TabSelesai extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataSelesai = [
    {
      'title': 'Ikuti Event Komunitas',
      'progress': 100,
      'status': 'Silahkan klaim hadiahmu!',
      'tempColor': Pallete.secondaryDarker
    },
    {
      'title': 'Tukarkan 1 kg sampah',
      'progress': 100,
      'status': 'Hadiah sudah diklaim!',
      'tempColor': Pallete.dark3
    },
  ];

  TabSelesai({super.key});

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
              itemCount: cardDataSelesai.length,
              itemBuilder: (context, index) {
                var data = cardDataSelesai[index];
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
