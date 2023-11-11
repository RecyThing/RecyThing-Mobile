import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ProfileInformasiLainnya extends StatelessWidget {
  const ProfileInformasiLainnya({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informasi Lainnya", style: ThemeFont.bodyNormalSemiBold),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            leading: const Icon(IconlyLight.calling),
            title: Text(
              "Hubungi Kami",
              style: ThemeFont.bodyNormalReguler,
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
              "assets/icons/profile/mbarecy.png",
              width: 24,
            ),
            title: Text("Tanya Recy", style: ThemeFont.bodyNormalReguler),
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
              "assets/icons/profile/pertanyaan.png",
              width: 24,
            ),
            title: Text(
              "Pertanyaan Umum",
              style: ThemeFont.bodyNormalReguler,
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
            leading: const Icon(
              IconlyLight.logout,
              color: Pallete.error,
            ),
            title: Text(
              "Keluar",
              style: ThemeFont.bodyNormalReguler.copyWith(color: Pallete.error),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
