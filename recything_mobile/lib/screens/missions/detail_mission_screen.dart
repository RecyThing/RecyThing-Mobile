import 'package:flutter/material.dart';
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
  String progressState = 'Unggah Bukti';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomLeadingAppBar(title: 'Detail Misi'),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Image.network(
                fit: BoxFit.cover,
                'https://th-thumbnailer.cdn-si-edu.com/VfbEt333BHHvojYjzpms7_qeTU0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/f6/30/f6300fcc-c929-4e30-adaa-fc3b62a495a5/42-18260830edit.jpg'),
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
                      'Buang Sampah',
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
                          '02 Desember 2023',
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
                          progressState == 'verified'
                              ? '5.000 Poin'
                              : '100 Poin',
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
                  'Buanglah sampah yang berserakan pada\ntempatnya',
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
                            onPressed: progressState == 'Unggah Bukti'
                                ? () => Navigator.pushNamed(
                                            context, '/unggah-bukti')
                                        .then((value) {
                                      setState(() {
                                        progressState = value.toString();
                                      });
                                    })
                                : () {},
                            child: Text(
                              progressState,
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
