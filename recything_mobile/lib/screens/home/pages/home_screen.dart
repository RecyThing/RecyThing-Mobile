import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_user_profile/get_user_profile_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/widgets/home_banner.dart';
import 'package:recything_mobile/screens/home/widgets/home_header.dart';
import 'package:recything_mobile/screens/home/widgets/home_poin_card.dart';
import 'package:recything_mobile/screens/home/widgets/home_rekomendasi_artikel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    context.read<GetUserProfileCubit>().fetchMe(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
              builder: (context, state) {
                if (state is GetUserProfileLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetUserProfilefailure) {
                  return Text(state.message);
                } else if (state is GetUserProfileSuccess) {
                  return SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        HomeHeader(
                          user: state.data,
                        ),
                        Positioned(
                            bottom: 0,
                            child: HomePoinCard(
                              user: state.data,
                            ))
                      ],
                    ),
                  );
                }
                return SizedBox();
              },
            ),
            SizedBox(
              height: 24,
            ),
            HomeBanner(),
            HomeRekomendasiArtikel()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.main,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: () {
          Navigator.pushNamed(context, '/recy');
        },
        child: Image.asset("assets/icons/chatbot.png"),
      ),
    );
  }
}
