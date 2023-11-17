import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/detail_artikel/konten_detail_artikel.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';

class DetailArtikelScreen extends StatefulWidget {
  const DetailArtikelScreen({super.key});

  @override
  State<DetailArtikelScreen> createState() => _DetailArtikelScreenState();
}

class _DetailArtikelScreenState extends State<DetailArtikelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 42, left: 16, right: 16),
            child: HeaderPageWidget(title: 'Detail Artikel'),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Image.asset(
              'assets/images/artikel_plastik.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          const KontenDetailArtikelWidget()
        ],
      ),
    );
  }
}
