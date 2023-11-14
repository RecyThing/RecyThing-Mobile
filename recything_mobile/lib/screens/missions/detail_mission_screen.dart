import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/progress_step.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class DetailMission extends StatelessWidget {
  final String progressState = 'Unggah Bukti';

  const DetailMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Pallete.light3)),
              child: IconButton(
                icon: const Icon(
                  IconlyLight.arrow_left,
                  size: 24,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Text(
              'Detail Misi',
              style: ThemeFont.heading6Medium,
            ),
            const SizedBox(
              width: 24,
            )
          ],
        ),
      ),
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
                Text(
                  'Buang Sampah',
                  style: ThemeFont.bodyLargeMedium,
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
                              .copyWith(color: Pallete.infoLigther),
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
                          '100 poin',
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
                ProgressStep(
                  progressState: progressState,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MainButton(
                      onPressed: () {},
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
