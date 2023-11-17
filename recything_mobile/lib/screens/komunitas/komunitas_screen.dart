import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/komunitas_search_screen.dart';
import 'package:recything_mobile/screens/komunitas/widgets/komunitas_card.dart';
import 'package:recything_mobile/screens/komunitas/widgets/lokasi_dropdown.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

class KomunitasScreen extends StatelessWidget {
  const KomunitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const LokasiDropdown(),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const KomunitasSearchScreen(),
                  ));
                },
                child: const MainTextField(
                  enabled: false,
                  label: "Cari Komunitas disini...",
                  prefixIcon: IconlyLight.search,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Komunitas Saya",
                    style: ThemeFont.heading6Reguler
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Center(child: Image.asset("assets/images/empty_komunitas.png")),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rekomendasi Komunitas",
                    style: ThemeFont.heading6Reguler
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const BodyLink("Lihat Semua"),
                ],
              ),
              const SizedBox(height: 24),
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
