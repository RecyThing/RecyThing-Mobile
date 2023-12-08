import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/custom_leading_app_bar.dart';
import 'package:recything_mobile/widgets/forms/progress_state_box.dart';
import 'package:recything_mobile/screens/missions/widgets/progress_step.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class DetailMissionScreen extends StatefulWidget {
  const DetailMissionScreen({super.key});

  @override
  State<DetailMissionScreen> createState() => _DetailMissionScreenState();
}

class _DetailMissionScreenState extends State<DetailMissionScreen> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final formattedDate =
        DateFormat("d MMMM y", "id_ID").format(args['expiredDate']);
    String progressState = args['progressState'];

    return Scaffold(
      appBar: const CustomLeadingAppBar(title: 'Detail Misi'),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Image.network(
              args['imageUrl'],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      args['title'],
                      style: ThemeFont.bodyLargeMedium,
                    ),
                    progressState == 'verified'
                        ? ProgressStateBox(
                            child: Text(
                            'Terverifikasi',
                            style: ThemeFont.bodySmallRegular
                                .copyWith(color: Colors.white),
                          ))
                        : const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berlaku Sampai',
                          style: ThemeFont.bodySmallRegular,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          formattedDate,
                          style: ThemeFont.bodySmallSemiBold
                              .copyWith(color: Pallete.main),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hadiah', style: ThemeFont.bodySmallRegular),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${args['point']} Poin',
                          style: ThemeFont.bodySmallSemiBold
                              .copyWith(color: Pallete.secondary),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Deskripsi',
                  style: ThemeFont.bodySmallSemiBold,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  args['desc'],
                  style: ThemeFont.bodySmallRegular,
                ),
                const SizedBox(
                  height: 24,
                ),
                ProgressStep(progressState: progressState),
                const SizedBox(
                  height: 24,
                ),
                progressState == 'verified'
                    ? const SizedBox()
                    : SizedBox(
                        width: double.infinity,
                        child: MainButton(
                            onPressed: progressState == 'Aktif'
                                ? () {}
                                : () => Navigator.pushNamed(
                                            context, '/unggah-bukti')
                                        .then((value) {
                                      setState(() {
                                        progressState = value.toString();
                                      });
                                    }),
                            child: Text(
                              progressState == 'Aktif'
                                  ? 'Terima Tantangan'
                                  : 'Unggah Bukti',
                              style: ThemeFont.heading6Bold
                                  .copyWith(color: Colors.white),
                            )),
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
