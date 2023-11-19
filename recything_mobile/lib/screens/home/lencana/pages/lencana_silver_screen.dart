import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_card.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_keuntungan.dart';
import 'package:recything_mobile/screens/home/lencana/widgets/lencana_poin.dart';

class LencanaSilverScreen extends StatelessWidget {
  const LencanaSilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LencanaCard(
              image: "lencana_silver",
              title: "Silver",
              subtitle: "Sudah saatnya menjadi Pahlawan \nlingkungan!",
              angka: "50.000"),
          LencanaPoin(color: Pallete.silver, nilai: 1),
          LencanaKeuntungan(persen: "12", color: Pallete.silver)
        ],
      ),
    );
  }
}
