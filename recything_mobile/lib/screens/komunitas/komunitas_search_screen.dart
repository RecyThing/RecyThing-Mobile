import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/badges.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class KomunitasSearchScreen extends StatelessWidget {
  const KomunitasSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomBackButton(),
                    Text(
                      "Cari Komunitas",
                      style: ThemeFont.heading6Reguler,
                    ),
                    const SizedBox(width: 40)
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const MainTextField(
                label: "Cari Komunitas disini...",
                prefixIcon: IconlyLight.search,
              ),
              const SizedBox(height: 16),
              DropdownButton(
                isDense: true,
                value: "Berdasarkan Lokasi",
                icon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(IconlyLight.arrow_down_2),
                ),
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: "Berdasarkan Lokasi",
                    child: Text(
                      "Berdasarkan Lokasi",
                      style: ThemeFont.bodySmallMedium,
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Anggota Terbanyak",
                    child: Text(
                      "Anggota Terbanyak",
                      style: ThemeFont.bodySmallMedium,
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Center(
                  child:
                      Image.asset("assets/images/empty_komunitas_search.png")),
              const SizedBox(height: 24),
              Text("Rekomendasi Kota", style: ThemeFont.bodySmallMedium),
              const SizedBox(height: 16),
              const Wrap(
                spacing: 8,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: CustomBadge(text: "Jakarta"),
                  ),
                  CustomBadge(text: "Bandung"),
                  CustomBadge(text: "Surabaya"),
                  CustomBadge(text: "Tangerang"),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(IconlyLight.location),
                    const SizedBox(width: 10),
                    Text(
                      "Jakarta Barat, DKI Jakarta",
                      style: ThemeFont.bodySmallMedium,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(IconlyLight.location),
                    const SizedBox(width: 10),
                    Text(
                      "Jakarta Barat, DKI Jakarta",
                      style: ThemeFont.bodySmallMedium,
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
