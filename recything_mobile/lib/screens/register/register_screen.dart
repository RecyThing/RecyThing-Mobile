import 'package:flutter/material.dart';
import 'package:recything_mobile/widgets/forms/google_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

import '../../constants/pallete.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    "Daftar",
                    style: ThemeFont.heading3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 242,
                    child: Text(
                      "Buat akun Anda sekarang dan mulailah menjelajah",
                      style: ThemeFont.bodyNormal
                          .copyWith(color: Pallete.textSecondary),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const MainTextField(
                    label: "Masukan Nama Lengkap",
                    prefixIcon: Icons.person_outline,
                  ),
                  const SizedBox(height: 12),
                  const MainTextField(
                    label: "Masukan Email",
                    prefixIcon: Icons.mail_outline_rounded,
                  ),
                  const SizedBox(height: 12),
                  const MainTextField(
                    label: "Masukan Kata Sandi",
                    prefixIcon: Icons.lock_outline_rounded,
                  ),
                  const SizedBox(height: 12),
                  const MainTextField(
                    label: "Konfirmasi Kata Sandi",
                    prefixIcon: Icons.lock_outline_rounded,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Dengan mendaftar, Anda menyetujui ",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: ThemeFont.bodySmall
                              .copyWith(color: Pallete.textSecondary),
                        ),
                        Text(
                          "Ketentuan Layanan ",
                          style: ThemeFont.bodySmall.copyWith(
                            color: Pallete.main,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "dan ",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: ThemeFont.bodySmall
                              .copyWith(color: Pallete.textSecondary),
                        ),
                        Text(
                          " Kebijakan Privasi",
                          style: ThemeFont.bodySmall.copyWith(
                            color: Pallete.main,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                          child: MainButton(
                        child: Text(
                          "Register",
                          style: ThemeFont.heading6.copyWith(
                            color: Pallete.textMainButton,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
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
                        text: "Daftar Dengan Google",
                        onPressed: () {},
                      )),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah Punya Akun? ",
                        style: ThemeFont.bodyNormal
                            .copyWith(color: Pallete.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/login",
                          (route) => false,
                        ),
                        child: const BodyLink("Login"),
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
