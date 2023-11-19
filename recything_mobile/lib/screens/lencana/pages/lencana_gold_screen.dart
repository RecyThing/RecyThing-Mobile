import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/lencana/widgets/lencana_card.dart';
import 'package:recything_mobile/screens/lencana/widgets/lencana_keuntungan.dart';
import 'package:recything_mobile/screens/lencana/widgets/lencana_poin.dart';

class LencanaGoldScreen extends StatelessWidget {
  const LencanaGoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LencanaCard(
              image: "lencana_gold",
              title: "Gold",
              subtitle: "Emas untuk lingkungan, emas untuk \nAnda.",
              angka: "100.000"),
          LencanaPoin(color: Pallete.gold, nilai: 0.5),
          LencanaKeuntungan(persen: "15", color: Pallete.gold)
        ],
      ),
    );
  }
}
