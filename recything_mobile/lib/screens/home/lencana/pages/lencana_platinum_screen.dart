import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_card.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_keuntungan.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_poin.dart';

class LencanaPlatinumScreen extends StatelessWidget {
  const LencanaPlatinumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LencanaCard(
              image: "lencana_platinum",
              title: "Platinum",
              subtitle:
                  "Anda Seorang Pahlawan, Tidak ada yang bisa menghentikan Anda sekarang.",
              angka: "250.000"),
          LencanaPoin(color: Pallete.platinum, nilai: 0),
          LencanaKeuntungan(persen: "20", color: Pallete.platinum)
        ],
      ),
    );
  }
}
