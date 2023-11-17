import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/berhasil_bergabung_screen.dart';
import 'package:recything_mobile/widgets/badges.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/secondary_button.dart';

class DetailEventKomunitasScreen extends StatefulWidget {
  const DetailEventKomunitasScreen({super.key});

  @override
  State<DetailEventKomunitasScreen> createState() =>
      _DetailEventKomunitasScreenState();
}

class _DetailEventKomunitasScreenState extends State<DetailEventKomunitasScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 32, bottom: 8),
        width: double.infinity,
        child: Expanded(
          child: MainButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BerhasilBergabungScreen(),
              ));
            },
            child: Text(
              "Gabung Event",
              style: ThemeFont.heading6Reguler.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomBackButton(),
                    Text(
                      "Detail Event",
                      style: ThemeFont.heading6Reguler,
                    ),
                    const SizedBox(width: 40)
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 240,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bersih-bersih pantai pandawa",
                      style: ThemeFont.heading5Reguler,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const MainBadge(text: "Bali"),
                        const SizedBox(width: 8),
                        const SizedBox(width: 8),
                        Text(
                          "kuota tersisa : 190 orang",
                          style: ThemeFont.bodySmall
                              .copyWith(color: Pallete.dark3),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const CircleAvatar(
                          maxRadius: 24,
                          backgroundColor: Pallete.mainSubtle,
                          child: Icon(
                            IconlyLight.calendar,
                            color: Pallete.mainDarker,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "8 November 2023",
                              style: ThemeFont.heading6Bold
                                  .copyWith(color: Pallete.dark1),
                            ),
                            Text(
                              "Rabu, 08.00 WIB - 12.00 WIB",
                              style: ThemeFont.bodySmallSemiBold
                                  .copyWith(color: Pallete.dark3),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const CircleAvatar(
                          maxRadius: 24,
                          backgroundColor: Pallete.mainSubtle,
                          child: Icon(
                            IconlyLight.location,
                            color: Pallete.mainDarker,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pantai Pandawa",
                              style: ThemeFont.heading6Bold
                                  .copyWith(color: Pallete.dark1),
                            ),
                            Text(
                              "Desa Kutuh, Badung, Kuta, Bali",
                              style: ThemeFont.bodySmallSemiBold
                                  .copyWith(color: Pallete.dark3),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {},
                            child: Text(
                              "Lihat Di Maps",
                              style: ThemeFont.heading6Bold
                                  .copyWith(color: Pallete.main),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: Pallete.dark4,
                      thickness: 1,
                      height: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi Event",
                      style: ThemeFont.heading5Reguler.copyWith(
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Bergabunglah dengan kami dalam acara membersihkan Pantai Pandawa di Bali! Kami akan bersama-sama membersihkan dan merawat salah satu pantai indah Bali, Pantai Pandawa. Sebuah kesempatan untuk peduli terhadap lingkungan dan menjaga kebersihan pantai ini. Mari bersatu demi pantai yang lebih bersih dan lestari! Jadilah bagian dari gerakan ini dan bergabunglah dalam upaya pelestarian alam.",
                      style: ThemeFont.bodySmall
                          .copyWith(height: 1.6, color: Pallete.dark3),
                    ),
                    const SizedBox(height: 120)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
