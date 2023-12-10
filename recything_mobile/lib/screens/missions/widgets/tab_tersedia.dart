import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_missions/get_missions_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/mission_card.dart';

class TabTersedia extends StatefulWidget {
  TabTersedia({super.key});

  @override
  State<TabTersedia> createState() => _TabTersediaState();
}

class _TabTersediaState extends State<TabTersedia> {
  @override
  void initState() {
    context.read<GetMissionsCubit>().getMissions();
    super.initState();
  }

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
            style: ThemeFont.heading6Medium.copyWith(color: Pallete.dark3),
          ),
        ),
        Expanded(
          child: BlocBuilder<GetMissionsCubit, GetMissionsState>(
            builder: (context, state) {
              if (state is GetMissionsLoaded) {
                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    itemCount: state.missions.data.length,
                    itemBuilder: (context, index) {
                      var data = state.missions.data[index];
                      return Column(
                        children: [
                          MissionCard(
                            title: data.title,
                            subTitle: Text(
                              data.description,
                              style: ThemeFont.bodySmallRegular,
                            ),
                            imageUrl: data.missionImage,
                            args: {
                              'imageUrl': data.missionImage,
                              'title': data.title,
                              'expiredDate': data.endDate,
                              'point': data.point,
                              'desc': data.description,
                              'progressState': 'Aktif'
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      );
                    });
              } else if (state is GetMissionsLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Pallete.main,
                ));
              }

              return Center(
                  child: Text(
                'Terjadi Kesalahan',
              ));
            },
          ),
        )
      ],
    );
  }
}
