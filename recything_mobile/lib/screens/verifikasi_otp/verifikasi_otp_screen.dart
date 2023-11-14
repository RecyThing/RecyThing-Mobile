import 'package:flutter/material.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/otp_textfield.dart';

import '../../constants/pallete.dart';

class VerifikasiOtpScreen extends StatelessWidget {
  const VerifikasiOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 66),
              const CustomBackButton(),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Verifikasi OTP",
                style: ThemeFont.heading3Reguler,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 310,
                child: Text(
                  "Masukan OTP untuk verifikasi pemulihan",
                  style: ThemeFont.bodyNormal
                      .copyWith(color: Pallete.textSecondary),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 70, width: 70, child: OtpTextField(label: "")),
                    Expanded(child: SizedBox()),
                    SizedBox(
                        height: 70, width: 70, child: OtpTextField(label: "")),
                    Expanded(child: SizedBox()),
                    SizedBox(
                        height: 70, width: 70, child: OtpTextField(label: "")),
                    Expanded(child: SizedBox()),
                    SizedBox(
                        height: 70, width: 70, child: OtpTextField(label: "")),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Tidak menerima kode? ",
                    style: ThemeFont.bodySmall
                        .copyWith(color: Pallete.textSecondary),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/reset_password");
                    },
                    child: Text(
                      "Kirim Ulang",
                      style: ThemeFont.bodySmall.copyWith(
                        color: Pallete.main,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                      child: MainButton(
                    child: Text(
                      "Konfirmasi",
                      style: ThemeFont.heading6Reguler.copyWith(
                        color: Pallete.textMainButton,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/password_baru');
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(child: SizedBox()),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
