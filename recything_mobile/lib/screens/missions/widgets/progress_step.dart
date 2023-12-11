import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/progress_card.dart';

class ProgressStep extends StatelessWidget {
  final String progressState;

  const ProgressStep({super.key, required this.progressState});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            ProgressCard(
              title: 'Satu tantangan untukmu.',
              subTitle: 'Buanglah sampah yang\nberserakan pada tempatnya',
              backgroundColor:
                  progressState == 'Aktif' ? Colors.white : Pallete.mainSubtle,
            ),
            const SizedBox(
              height: 24,
            ),
            ProgressCard(
              title: progressState == 'Selesai'
                  ? 'Bukti terverifikasi'
                  : 'Unggah bukti',
              subTitle: progressState == 'Selesai'
                  ? 'Bukti kamu sudah cukup\nkuat.'
                  : 'Unggah foto bukti\npengerjaan tantangan',
              backgroundColor: progressState == 'Selesai'
                  ? Pallete.mainSubtle
                  : Colors.white,
            ),
            const SizedBox(
              height: 24,
            ),
            ProgressCard(
              title: 'Yay! Tantangan selesai.',
              subTitle:
                  'Hadiah kamu sudah dikirim nih,\nCek notifikasi kamu sekarang!',
              backgroundColor: progressState == 'Selesai'
                  ? Pallete.mainSubtle
                  : Colors.white,
            ),
          ],
        ),
        Positioned(
          left: 24,
          top: 36,
          child: Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: progressState == 'Aktif'
                          ? Pallete.dark4
                          : Pallete.main,
                      width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: progressState == 'Aktif'
                    ? const SizedBox()
                    : const Icon(
                        Icons.check,
                        color: Pallete.main,
                        size: 20,
                      ),
              ),
              DottedLine(
                dashColor: progressState == 'Unggah Bukti' ||
                        progressState == 'Selesai'
                    ? Pallete.main
                    : Pallete.dark4,
                lineThickness: 3,
                lineLength: 94,
                dashLength: 6,
                dashGapLength: 8,
                direction: Axis.vertical,
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: progressState == 'Unggah Bukti' ||
                          progressState == 'Selesai'
                      ? Pallete.main
                      : Pallete.dark4,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Icon(
                  IconlyLight.camera,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              DottedLine(
                dashColor:
                    progressState == 'Selesai' ? Pallete.main : Pallete.dark4,
                lineThickness: 3,
                lineLength: 94,
                dashLength: 6,
                dashGapLength: 8,
                direction: Axis.vertical,
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: progressState == 'Selesai'
                          ? Pallete.main
                          : Pallete.dark4,
                      width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  IconlyBold.ticket_star,
                  size: 20,
                  color: progressState == 'Selesai'
                      ? Pallete.errorSubtle
                      : Pallete.dark4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
