import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/kategori_daur_ulang_screen/all_menu_kategori.dart';
import 'package:recything_mobile/screens/article/widget/kategori_daur_ulang_screen/kategori_header.dart';

class KategoriDaurUlangPage extends StatelessWidget {
  const KategoriDaurUlangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 66, left: 16, right: 16),
        child: ListView(
          children: [
            const HeaderKategoriWidget(),
            AllMenuKategoriWidget(),
          ],
        ),
      ),
    );
  }
}
