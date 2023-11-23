import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class LaporanBerhasilWidget extends StatelessWidget {
  const LaporanBerhasilWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Row(
                children: [
                  CustomBackButton(),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Image.asset("assets/images/success.png"),
              Text(
                "Laporan Terkirim",
                style: ThemeFont.heading3Medium,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                child: Text('Terimakasih telah berkontribusi untuk melaporkan pelanggaran dan kondisi sampah yang kamu temui, kami sangat mengapresiasi usaha anda.',
                  style: ThemeFont.bodyNormalReguler
                      .copyWith(color: Pallete.dark3),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(child: SizedBox()),
              const SizedBox(
                height: 24,
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Kembali ke Beranda",
                        style: ThemeFont.bodyNormal.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
