import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/widget/bottom_sheet_widget.dart';

class CardReportLittering extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subTitle;
  final int selectedIndex;
  final int currentIndex;
  final Function(int) onTap;

  const CardReportLittering({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.subTitle,
    required this.selectedIndex,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(selectedIndex == currentIndex ? -1 : currentIndex);
      },
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: currentIndex == selectedIndex ? Pallete.main : Pallete.dark3,
          ),
          borderRadius: BorderRadius.circular(12),
          color: currentIndex == selectedIndex ? Pallete.main : Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 30,
                    right: 6,
                  ),
                  child: Image.asset(assetPath,
                      color: currentIndex == selectedIndex
                          ? Colors.white
                          : Colors.black),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (currentIndex == 0) {
                      onTap:
                      () {
                        if (currentIndex == 0) {
                          BottomSheetWidget(
                            title: 'Apa itu Pelanggaran Individu?',
                            subtitle:
                                'Pelanggaran individu adalah pelanggaran yang dilakukan oleh perorangan.',
                          ).showBottomSheet(context);
                        } else if (currentIndex == 1) {
                          BottomSheetWidget(
                            title: 'Apa itu Pelanggaran Perusahaan?',
                            subtitle:
                                'Pelanggaran perusahaan adalah pelanggaran yang dilakukan oleh perusahaan atau organisasi.',
                          ).showBottomSheet(context);
                        }
                      };
                    }
                  },
                  child: Image.asset("assets/images/faq_icon.png",
                      color: currentIndex == selectedIndex
                          ? Colors.white
                          : Colors.black),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Divider(
                color: currentIndex == selectedIndex
                    ? Colors.white
                    : Colors.black),
            const SizedBox(height: 8),
            Text(title,
                style: ThemeFont.bodyMediumMedium.copyWith(
                    color: currentIndex == selectedIndex
                        ? Colors.white
                        : Colors.black)),
            const SizedBox(height: 8),
            Divider(
                color: currentIndex == selectedIndex
                    ? Colors.white
                    : Colors.black),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(subTitle,
                  textAlign: TextAlign.center,
                  style: ThemeFont.bodySmallRegular.copyWith(
                      color: currentIndex == selectedIndex
                          ? Colors.white
                          : Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
