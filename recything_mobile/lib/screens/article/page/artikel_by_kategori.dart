import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:recything_mobile/screens/article/widget/list_artikel.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';

class ArtikelByKategoriScreen extends StatefulWidget {
  const ArtikelByKategoriScreen({super.key});

  @override
  State<ArtikelByKategoriScreen> createState() => _ArtikelByKategoriScreenState();
}

class _ArtikelByKategoriScreenState extends State<ArtikelByKategoriScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66, left: 16, right: 16),
        child: Column(
          children: [
            HeaderPageWidget(title: 'Minyak'),
            SizedBox(height: 24),
            SearchBarWidget(),
            SizedBox(height: 8),
            ListArtikelWidget(),
          ],
        ),
      ),
    );
  }
}
