import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/widgets/lencana_card.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';

class LencanaScreen extends StatelessWidget {
  const LencanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Pallete.textMainButton,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: Text(
          "Lencana",
          style: ThemeFont.heading6Medium,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LencanaCard(
                image: "lencana_bronze",
                title: "Bronze",
                subtitle:
                    "Selangkah lebih dekat menuju lingkungan yang lebih bersih dan sehat",
                angka: "0"),
            LencanaCard(
                image: "lencana_silver",
                title: "Silver",
                subtitle: "Sudah saatnya menjadi Pahlawan \nlingkungan!",
                angka: "50.000"),
            LencanaCard(
                image: "lencana_gold",
                title: "Gold",
                subtitle: "Emas untuk lingkungan, emas untuk \nAnda.",
                angka: "100.000"),
            LencanaCard(
                image: "lencana_platinum",
                title: "Platinum",
                subtitle:
                    "Anda Seorang Pahlawan, Tidak ada yang bisa menghentikan Anda sekarang.",
                angka: "250.000")
          ],
        ),
      ),
    );
  }
}
