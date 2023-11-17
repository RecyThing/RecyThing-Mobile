import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/cari_artikel/artikel_tidak_ditemukan.dart';
import 'package:recything_mobile/screens/article/widget/list_artikel.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SizedBox(
        // width: 328,
        height: 500,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Populer'),
                Tab(text: 'Terbaru'),
              ],
            ),
            // SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                children: [
                  ListArtikelWidget(),
                  ArtikelTidakDitemukanWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
