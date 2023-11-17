import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';
import 'package:recything_mobile/screens/article/widget/tapbar.dart';

class CariArtikelScreen extends StatefulWidget {
  const CariArtikelScreen({super.key});

  @override
  State<CariArtikelScreen> createState() => _CariArtikelScreenState();
}

class _CariArtikelScreenState extends State<CariArtikelScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66, left: 16, right: 16),
        child: Column(
          children: [
            HeaderPageWidget(title: 'Cari Artikel'),
            SizedBox(height: 24),
            SearchBarWidget(),
            SizedBox(height: 8),
            TapBarWidget()
          ],
        ),
      ),
    );
  }
}
