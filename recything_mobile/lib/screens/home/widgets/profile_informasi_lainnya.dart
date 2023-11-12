import 'package:flutter/material.dart';
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
          Text("Informasi Lainnya",
              style: ThemeFont.interText
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            leading: Image.asset(
              "assets/icons/profile/hubungi.png",
              width: 24,
            ),
            title: Text(
              "Hubungi Kami",
              style: ThemeFont.interText.copyWith(fontSize: 16),
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
              "assets/icons/profile/recybot.png",
              width: 24,
            ),
            title: Text(
              "Chat dengan Recybot",
              style: ThemeFont.interText.copyWith(fontSize: 16),
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
              "assets/icons/profile/pertanyaan.png",
              width: 24,
            ),
            title: Text(
              "Pertanyaan Umum",
              style: ThemeFont.interText.copyWith(fontSize: 16),
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
              "assets/icons/profile/logout.png",
              width: 24,
            ),
            title: Text(
              "Keluar",
              style: ThemeFont.interText
                  .copyWith(fontSize: 16, color: Pallete.error),
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
