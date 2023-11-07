import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/widgets/profile_informasi_akun.dart';
import 'package:recything_mobile/screens/home/widgets/profile_informasi_lainnya.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.textMainButton,
        centerTitle: true,
        title: Text(
          "Profil",
          style: ThemeFont.interText
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile Pengguna",
                style: ThemeFont.interText
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 69, 196, 169)),
                  child: Text(
                    "W",
                    style: ThemeFont.interText.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Pallete.textMainButton),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kaisar Panjaitan",
                      style: ThemeFont.interText
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Emailku@gmail.com",
                      style: ThemeFont.interText
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            const ProfileInformasiAkun(),
            const ProfileInformasiLainnya()
          ],
        ),
      ),
    );
  }
}
