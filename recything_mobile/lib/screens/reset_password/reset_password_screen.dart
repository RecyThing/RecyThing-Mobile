import 'package:flutter/material.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/forms/secondary_button.dart';

import '../../constants/pallete.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
              SecondaryButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Pallete.dark1,
                  size: 24,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Atur Ulang Kata Sandi",
                style: ThemeFont.heading3,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 310,
                child: Text(
                  "Untuk melakukan pemulihan, Masukan Alamat Email yang terhubung",
                  style: ThemeFont.bodyNormal
                      .copyWith(color: Pallete.textSecondary),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const MainTextField(
                  label: "Masukan Email Anda",
                  prefixIcon: Icons.mail_outline_rounded),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: MainButton(
                    child: Text(
                      "Selanjutnya",
                      style: ThemeFont.heading6.copyWith(
                        color: Pallete.textMainButton,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/verifikasi_otp');
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
