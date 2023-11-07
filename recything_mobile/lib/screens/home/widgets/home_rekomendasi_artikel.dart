import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class HomeRekomendasiArtikel extends StatelessWidget {
  const HomeRekomendasiArtikel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rekomendasi Artikel",
                style: ThemeFont.interText
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Lihat Semua",
                    style: ThemeFont.interText.copyWith(
                        color: Pallete.main, fontWeight: FontWeight.w400),
                  ))
            ],
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(top: 16),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Pallete.dark4),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
