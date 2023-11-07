import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/custom_teks.dart';

class ProfileInformasiAkun extends StatelessWidget {
  const ProfileInformasiAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informasi Akun",
              style: ThemeFont.interText
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            leading: Image.asset(
              "assets/icons/profile/profile.png",
              width: 24,
            ),
            title: Row(
              children: [
                Text(
                  "Profile Saya",
                  style: ThemeFont.interText.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  width: 8,
                ),
                const CustomTeks(
                  name: "Lengkapi Profile",
                  color: Pallete.error,
                  size: 8,
                )
              ],
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            leading: Image.asset(
              "assets/icons/profile/poinku.png",
              width: 24,
            ),
            title: Text(
              "Poinku",
              style: ThemeFont.interText.copyWith(fontSize: 16),
            ),
            trailing: const CustomTeks(
              name: "500.992",
              color: Pallete.main,
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            leading: Image.asset(
              "assets/icons/profile/lencana.png",
              width: 24,
            ),
            title: Text(
              "Lencana",
              style: ThemeFont.interText.copyWith(fontSize: 16),
            ),
            trailing: const CustomTeks(
              name: "Gold",
              color: Pallete.secondaryDarker,
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
