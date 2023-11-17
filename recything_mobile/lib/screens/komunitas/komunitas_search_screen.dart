import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/widgets/komunitas_card.dart';
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
              const SizedBox(height: 16),
              const KomunitasCard(
                title: "Electronic Waste RJ Indonesian Community",
                lokasi: "Jakarta",
                anggota: "25,6",
                image:
                    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
              ),
              const KomunitasCard(
                title: "Zero Waste Indonesia Community",
                lokasi: "Bogor",
                anggota: "5,6",
                image:
                    "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=",
              ),
              const KomunitasCard(
                title: "Komunitas Edukasi Bijak Sampah",
                lokasi: "Bandung",
                anggota: "11,6",
                image:
                    "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg",
              ),
              const SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}
