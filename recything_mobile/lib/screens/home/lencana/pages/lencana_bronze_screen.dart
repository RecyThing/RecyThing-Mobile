import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_card.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_keuntungan.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_poin.dart';

class LencanaBronzeScreen extends StatelessWidget {
  const LencanaBronzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LencanaCard(
              image: "lencana_bronze",
              title: "Bronze",
              subtitle:
                  "Selangkah lebih dekat menuju lingkungan yang lebih bersih dan sehat",
              angka: "0"),
          LencanaPoin(color: Pallete.bronze, nilai: 1.0),
          LencanaKeuntungan(persen: "10", color: Pallete.bronze)
        ],
      ),
    );
  }
}
