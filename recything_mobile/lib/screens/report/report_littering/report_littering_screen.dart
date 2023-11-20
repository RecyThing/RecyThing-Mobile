import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/report_littering/pelanggaran_kecil_screen.dart';
import 'package:recything_mobile/screens/report/report_littering/widgets/choose_report_card.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class ReportLitteringScreen extends StatelessWidget {
  const ReportLitteringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 32, bottom: 8),
        width: double.infinity,
        child: Expanded(
          child: MainButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PelanggaranKecilScreen(),
              ));
            },
            child: Text(
              "Selanjutnya",
              style: ThemeFont.heading6Reguler.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                Text(
                  "Pelanggaran Sampah",
                  style: ThemeFont.heading6Reguler,
                ),
                const SizedBox(width: 40)
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Pilih Jenis Pelaku Pelanggaran Sampah",
              style: ThemeFont.bodySmallMedium,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChooseReportCard(
                assetPath: "assets/images/littering_individu.png",
                title: "Individu",
                subTitle: "Pelanggaran oleh Perorangan",
                selected: true,
              ),
              ChooseReportCard(
                assetPath: "assets/images/littering_perusahaan.png",
                title: "Perusahaan",
                subTitle: "Pelanggaran oleh Perusahaan",
                selected: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}