import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/password_text_field.dart';

class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({super.key});

  @override
  State<UbahPasswordScreen> createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Pallete.textMainButton,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: Text(
          "Ubah Password",
          style: ThemeFont.heading6Medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kata Sandi Baru",
              style: ThemeFont.heading3Bold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 28),
              child: Text(
                "Ubah kata sandimu secara berkala untuk menjaga keamanan akun RecyThingmu",
                style: ThemeFont.bodyNormalReguler,
              ),
            ),
            const PasswordTextField(label: "Masukkan Kata Sandi Sekarang"),
            const PasswordTextField(label: "Masukkan Kata Sandi Baru"),
            const PasswordTextField(label: "Masukkan Kata Sandi Sekarang"),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MainButton(
                  onPressed: () {},
                  child: Text(
                    "Simpan",
                    style: ThemeFont.heading6Reguler.copyWith(
                        color: Pallete.textMainButton,
                        fontWeight: FontWeight.w700),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
