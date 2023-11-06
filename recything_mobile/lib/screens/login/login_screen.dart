import 'package:flutter/material.dart';
import 'package:recything_mobile/widgets/forms/google_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';
import 'package:recything_mobile/widgets/typography/body_normal.dart';

import '../../constants/pallete.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              const SizedBox(
                height: 80,
              ),
              Text(
                "Masuk",
                style: ThemeFont.interText
                    .copyWith(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                width: 242,
                child: BodyNormal(
                  "Masuk akun Anda sekarang dan mulailah menjelajah",
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const MainTextField(
                  label: "Masukan Email / No HP",
                  prefixIcon: Icons.mail_outline_rounded),
              const SizedBox(
                height: 12,
              ),
              const MainTextField(
                  label: "Masukan Kata Sandi",
                  prefixIcon: Icons.lock_outline_rounded),
              const SizedBox(
                height: 12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BodyNormal("Lupa Password? "),
                  BodyLink("Atur Ulang"),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: MainButton(
                    text: "Login",
                    onPressed: () {},
                  )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: GoogleButton(
                    text: "Masuk Dengan Google",
                    onPressed: () {},
                  )),
                ],
              ),
              const Expanded(child: SizedBox()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BodyNormal("Tidak Punya Akun? "),
                  BodyLink("Register"),
                ],
              ),
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
