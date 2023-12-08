import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
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
          // SizedBox(
          //   height: 240,
          //   width: double.infinity,
          //   child: Image.asset(
          //     'assets/images/artikel_plastik.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // const SizedBox(height: 24),
          const KontenDetailArtikelWidget()
        ],
      ),
      bottomNavigationBar: Container(
        height: 88,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 56,
                // width: 242,
                // width: double.infinity,
                decoration: BoxDecoration(
                    color: Pallete.main,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  'Share',
                  style: ThemeFont.heading6Bold.copyWith(color: Colors.white),
                )),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              height: 56,
              width: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.main),
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    'assets/icons/icon_green_like_outline.png',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
