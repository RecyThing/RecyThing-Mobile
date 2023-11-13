import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/widget/custom_card.dart';

class DetailRiwayatPelaporanScreen extends StatefulWidget {
  const DetailRiwayatPelaporanScreen({super.key});

  @override
  State<DetailRiwayatPelaporanScreen> createState() =>
      _DetailRiwayatPelaporanScreenState();
}

class _DetailRiwayatPelaporanScreenState
    extends State<DetailRiwayatPelaporanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail pelaporan'),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomCard(
            title: title,
            description: description,
            assetImage: assetImage,
            cardColor: cardColor)
      ]),
    );
  }
}
