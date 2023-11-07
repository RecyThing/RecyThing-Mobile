import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil",
          style: ThemeFont.interText
              .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Profile Pengguna",
                style:
                    ThemeFont.interText.copyWith(fontWeight: FontWeight.w100))
          ],
        ),
      ),
    );
  }
}
