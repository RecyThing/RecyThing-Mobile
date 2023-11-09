import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/widgets/forms/google_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

import '../../constants/pallete.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Container(
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
                    style: ThemeFont.heading3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 242,
                    child: Text(
                      "Masuk akun Anda sekarang dan mulailah menjelajah",
                      style: ThemeFont.bodyNormal
                          .copyWith(color: Pallete.textSecondary),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const MainTextField(
                    label: "Masukan Email / No HP",
                    prefixIcon: IconlyLight.message,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const MainTextField(
                    label: "Masukan Kata Sandi",
                    prefixIcon: IconlyLight.lock,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lupa Password? ",
                        style: ThemeFont.bodySmall
                            .copyWith(color: Pallete.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("/reset_password");
                        },
                        child: Text(
                          "Atur Ulang",
                          style: ThemeFont.bodySmall.copyWith(
                            color: Pallete.main,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: MainButton(
                        child: Text(
                          "Login",
                          style: ThemeFont.heading6.copyWith(
                              color: Pallete.textMainButton,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tidak Punya Akun? ",
                        style: ThemeFont.bodyNormal
                            .copyWith(color: Pallete.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/register",
                          (route) => false,
                        ),
                        child: const BodyLink("Register"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
