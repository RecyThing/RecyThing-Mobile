import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/berhasil_bergabung_screen.dart';
import 'package:recything_mobile/screens/komunitas/widgets/komunitas_event_card.dart';
import 'package:recything_mobile/widgets/badges.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class DetailKomunitasScreen extends StatefulWidget {
  const DetailKomunitasScreen({super.key});

  @override
  State<DetailKomunitasScreen> createState() => _DetailKomunitasScreenState();
}

class _DetailKomunitasScreenState extends State<DetailKomunitasScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
              "Ikuti Komunitas",
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
                      "Detail Komunitas",
                      style: ThemeFont.heading6Reguler,
                    ),
                    const SizedBox(width: 40)
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Hero(
                tag:
                    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
                child: Container(
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
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Zero Waste Indonesia Community",
                      style: ThemeFont.heading5Reguler,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBadge(text: "Jakarta"),
                        MainSubtleBadge(text: "Telah Bergabung"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 112,
                          child: AvatarStack(
                            height: 40,
                            avatars: [
                              for (var n = 0; n < 4; n++)
                                NetworkImage(
                                    'https://i.pravatar.cc/150?img=$n'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "3500 Peserta",
                          style: ThemeFont.bodySmall
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(
                      color: Pallete.dark4,
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 40,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Pallete.main,
                        labelStyle: ThemeFont.bodySmallMedium,
                        unselectedLabelColor: Pallete.dark3,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        dividerColor: Pallete.light4,
                        indicatorWeight: 1.2,
                        indicatorColor: Pallete.main,
                        onTap: (value) => _pageController.animateToPage(
                          value,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        ),
                        tabs: const [
                          Tab(
                            text: 'Detail',
                          ),
                          Tab(
                            text: 'Event',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Komunitas ini beranggotakan mereka yang memiliki kesadaran akan pentingnya mengurangi, mendaur ulang, dan menggunakan kembali sumber daya untuk mengurangi dampak negatif terhadap lingkungan. Dalam komunitas ini, para anggota berbagi pengetahuan, pengalaman, dan ide-ide terkait daur ulang. Mereka juga bisa berpartisipasi dalam kegiatan seperti kampanye daur ulang, pengelolaan limbah.",
                        style: ThemeFont.bodySmall.copyWith(
                          height: 1.6,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          KomunitasEventCard(),
                          KomunitasEventCard(),
                          KomunitasEventCard(),
                        ],
                      ),
                    )
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
