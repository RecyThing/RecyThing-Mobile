import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/poinku/widgets/detail_transaksi_card.dart';
import 'package:recything_mobile/screens/poinku/widgets/rincian_transaksi_card.dart';
import 'package:recything_mobile/widgets/forms/custom_app_bar.dart.dart';

class DetailTransaksiScreen extends StatelessWidget {
  const DetailTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                CustomAppBar(
                  title: "Detail Transaksi",
                  onTap: () => Navigator.pushNamed(context, '/poinku'),
                ),
                const Positioned(top: 150, child: DetailTransaksiCard())
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const RincianTransaksiCard()
        ],
      ),
    );
  }
}
