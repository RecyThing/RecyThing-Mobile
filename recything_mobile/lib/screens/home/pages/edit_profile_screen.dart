import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: Text(
          "Edit Profile",
          style: ThemeFont.heading6Medium,
        ),
        centerTitle: true,
        backgroundColor: Pallete.textMainButton,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 69, 196, 169),
                        shape: BoxShape.circle),
                    child: Text(
                      "W",
                      style: ThemeFont.heading3Bold.copyWith(
                          fontSize: 60, color: Pallete.textMainButton),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Pallete.main,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: Pallete.textMainButton)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.camera,
                            color: Pallete.textMainButton,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 40),
              child: Text("Detail Akun", style: ThemeFont.bodyNormalSemiBold),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: MainTextField(
                label: "Nama Lengkap",
                prefixIcon: IconlyLight.profile,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: MainTextField(
                enable: false,
                label: "Email",
                prefixIcon: IconlyLight.message,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: MainTextField(
                maxLine: 4,
                label: "Masukkan Alamat",
                prefixIcon: IconlyLight.location,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: MainTextField(
                label: "Masukkan Tanggal Lahir",
                prefixIcon: IconlyLight.calendar,
              ),
            ),
            DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.9,
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(),
                  ),
                ),
                label: const Text("Tujuan"),
                leadingIcon: const Icon(IconlyLight.document),
                dropdownMenuEntries: const []),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MainButton(
                      onPressed: () {},
                      child: Text(
                        "Simpan",
                        style: ThemeFont.heading6Reguler.copyWith(
                            color: Pallete.textMainButton,
                            fontWeight: FontWeight.w700),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
