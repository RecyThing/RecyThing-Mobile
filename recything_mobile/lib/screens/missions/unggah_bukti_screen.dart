import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/custom_leading_app_bar.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class UnggahBuktiScreen extends StatelessWidget {
  const UnggahBuktiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomLeadingAppBar(title: 'Unggah Bukti'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Yuk, sertakan bukti\npengerjaan tantangan kamu.',
                  style: ThemeFont.bodyNormalReguler,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Pallete.main, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyLight.upload,
                        color: Pallete.mainDarker,
                      ),
                      Text(
                        'Unggah',
                        style: ThemeFont.bodyNormalReguler
                            .copyWith(fontSize: 10, color: Pallete.mainDarker),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Format file: JPG, PNG, MP4',
                  style:
                      ThemeFont.bodySmallRegular.copyWith(color: Pallete.dark3),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Maksimum file : 20 Mb',
                  style:
                      ThemeFont.bodySmallRegular.copyWith(color: Pallete.dark3),
                ),
                const SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keterangan (Opsional)',
                    style: ThemeFont.bodyNormalReguler.copyWith(height: 1.7),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText:
                          'Cth: Saya telah membuang sampah yang ada di rumah saya dan sekitar jalan pada tempatnya',
                      hintStyle:
                          ThemeFont.bodySmallMedium.copyWith(height: 1.7),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
                const SizedBox(
                  height: 164,
                ),
              ],
            )),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 44),
              child: MainButton(
                  onPressed: () => Navigator.pop(context, 'verified'),
                  child: Text(
                    'Kirim',
                    style: ThemeFont.heading6Bold.copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
