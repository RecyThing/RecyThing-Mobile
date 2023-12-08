import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/mission_card.dart';
import 'package:recything_mobile/screens/missions/widgets/sf_track_shape_widget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TabSelesai extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataSelesai = [
    {
      'title': 'Ikuti Event Komunitas',
      'progress': 100,
      'status': 'Hadiah diklaim otomatis!',
      'tempColor': Pallete.dark3
    },
    {
      'title': 'Tukarkan 1 kg sampah',
      'progress': 100,
      'status': 'Hadiah diklaim otomatis!',
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
                              SizedBox(
                                width: 100,
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                      overlayRadius: 0,
                                      thumbRadius: 4,
                                      thumbStrokeWidth: 0.5,
                                      thumbStrokeColor: Colors.white,
                                      disabledThumbColor: Pallete.mainDarker,
                                      activeTrackHeight: 8,
                                      disabledActiveTrackColor:
                                          Pallete.mainLigther,
                                      inactiveTrackHeight: 8,
                                      disabledInactiveTrackColor:
                                          Pallete.dark4),
                                  child: SfSlider(
                                    trackShape: SfTrackShapeWidget(),
                                    min: 0.0,
                                    max: 100.0,
                                    value: data['progress'],
                                    onChanged: null,
                                  ),
                                ),
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
                      imageUrl: '',
                      args: {
                        'imageUrl': 'data.missionImage',
                        'title': 'data.name',
                        'expiredDate': 'data.endDate',
                        'point': 'data.point',
                        'desc': 'data.description'
                      },
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
