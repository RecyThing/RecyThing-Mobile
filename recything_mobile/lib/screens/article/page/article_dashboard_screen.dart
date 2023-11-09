import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/article_dashboard_header.dart';
import 'package:recything_mobile/screens/article/widget/article_menu_kategori.dart';
import 'package:recything_mobile/screens/article/widget/article_menu_tukar_sampah.dart';
import 'package:recything_mobile/screens/article/widget/article_searchbar.dart';

class ArticleDashboardScreen extends StatefulWidget {
  const ArticleDashboardScreen({super.key});

  @override
  State<ArticleDashboardScreen> createState() => _ArticleDashboardScreenState();
}

class _ArticleDashboardScreenState extends State<ArticleDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ArticleDashboardHeader(),
          SearchBarWidget(),
          MenuKategoriWidget(),
          MenuTukarSampahWidget()
        ],
      ),
    );
  }
}
