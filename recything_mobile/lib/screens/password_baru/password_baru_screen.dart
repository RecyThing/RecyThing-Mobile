import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

import '../../constants/pallete.dart';

class PasswordBaruScreen extends StatefulWidget {
  const PasswordBaruScreen({super.key});

  @override
  State<PasswordBaruScreen> createState() => _PasswordBaruScreenState();
}

class _PasswordBaruScreenState extends State<PasswordBaruScreen> {
  bool showPwd = false;
  bool showPwd2 = false;

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
                "Kata Sandi Baru",
                style: ThemeFont.heading3Reguler,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 310,
                child: Text(
                  "Langkah terakhir, akun anda xxxx@gmail.com berhasil diverifikasi",
                  style: ThemeFont.bodyNormal
                      .copyWith(color: Pallete.textSecondary),
                ),
              ),
              const SizedBox(height: 24),
              MainTextField(
                label: "Masukan Kata Sandi",
                prefixIcon: IconlyLight.lock,
                obscureText: !showPwd,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPwd = !showPwd;
                    });
                  },
                  child: Icon(
                    !showPwd ? IconlyLight.show : IconlyLight.hide,
                    color: Pallete.dark3,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              MainTextField(
                label: "Konfirmasi Kata Sandi",
                prefixIcon: IconlyLight.lock,
                obscureText: !showPwd2,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPwd2 = !showPwd2;
                    });
                  },
                  child: Icon(
                    !showPwd2 ? IconlyLight.show : IconlyLight.hide,
                    color: Pallete.dark3,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                      child: Text(
                        "Simpan Password",
                        style: ThemeFont.heading6Reguler.copyWith(
                          color: Pallete.textMainButton,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ),
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
