import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/dashboard_header.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/menu_artikel_populer.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/menu_kategori.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/menu_tukar_sampah.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/searchbar.dart';

class ArticleDashboardPage extends StatefulWidget {
  const ArticleDashboardPage({super.key});

  @override
  State<ArticleDashboardPage> createState() => _ArticleDashboardPageState();
}

class _ArticleDashboardPageState extends State<ArticleDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ArticleDashboardHeader(),
          SearchBarWidget(),
          MenuKategoriWidget(),
          MenuTukarSampahWidget(),
          MenuArticlePopular()
        ],
      ),
    );
  }
}
