import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/widgets/home_banner.dart';
import 'package:recything_mobile/screens/home/widgets/home_header.dart';
import 'package:recything_mobile/screens/home/widgets/home_poin_card.dart';
import 'package:recything_mobile/screens/home/widgets/home_rekomendasi_artikel.dart';
import '../../../bloc/get_popular_article/get_popular_article_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetPopularArticleCubit>().getPopularArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  HomeHeader(),
                  Positioned(bottom: 0, child: HomePoinCard())
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            HomeBanner(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: HomeRekomendasiArtikel(),
            )
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
