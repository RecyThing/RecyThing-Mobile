import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/dashboard_header.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/menu_artikel_populer.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/menu_kategori.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/menu_tukar_sampah.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';

class ArticleDashboardScreen extends StatefulWidget {
  const ArticleDashboardScreen({super.key});

  @override
  State<ArticleDashboardScreen> createState() => _ArticleDashboardScreenState();
}

class _ArticleDashboardScreenState extends State<ArticleDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView(
          children: const [
            ArticleDashboardHeader(),
            Padding(
                padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                child: SearchBarWidget()),
            MenuKategoriWidget(),
            MenuTukarSampahWidget(),
            MenuArticlePopular()
          ],
        ),
      ),
    );
  }
}
