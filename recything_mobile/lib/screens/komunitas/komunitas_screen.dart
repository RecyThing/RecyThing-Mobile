import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/bloc/get_community/community_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/komunitas_search_screen.dart';
import 'package:recything_mobile/screens/komunitas/widgets/komunitas_card.dart';
import 'package:recything_mobile/screens/komunitas/widgets/lokasi_dropdown.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

class KomunitasScreen extends StatefulWidget {
  const KomunitasScreen({super.key});

  @override
  State<KomunitasScreen> createState() => _KomunitasScreenState();
}

class _KomunitasScreenState extends State<KomunitasScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CommunityCubit>().getCommunity();
  }

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
                  enable: false,
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
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed("/semua-komunitas"),
                    child: const BodyLink("Lihat Semua"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BlocBuilder<CommunityCubit, CommunityState>(
                builder: (context, state) {
                  if (state is CommunitySuccess) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: state.communities.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return KomunitasCard(
                          id: state.communities[index].id ?? "-",
                          title: state.communities[index].name ?? "Untitled",
                          lokasi: state.communities[index].location ?? "?",
                          anggota: "0",
                          image: state.communities[index].image ??
                              "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
                        );
                      },
                    );
                  }
                  if (state is CommunityLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox();
                },
              ),
              const SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}
