import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class RincianTransaksiCard extends StatelessWidget {
  const RincianTransaksiCard({super.key});
  Widget table(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: ThemeFont.interText.copyWith(color: Pallete.textSecondary),
            ),
          ),
          SizedBox(
            width: 150,
            child: Text(
              textAlign: TextAlign.right,
              overflow: TextOverflow.visible,
              value,
              style: ThemeFont.interText
                  .copyWith(fontWeight: FontWeight.w500, color: Pallete.dark1),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
          color: Pallete.textMainButton,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                spreadRadius: 0,
                blurRadius: 10,
                color: Pallete.dark1.withOpacity(0.15))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rincian Transaksi",
            style: ThemeFont.interText.copyWith(
              fontWeight: FontWeight.w700,
              color: Pallete.dark1,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          table("ID Transaksi", "21312312421"),
          table("Tanggal", "18 Oktober 2023"),
          table("Waktu", "14.21"),
          const SizedBox(
            height: 12,
          ),
          DashedLine(
            path: Path()
              ..cubicTo(0, 0, 0, 1, MediaQuery.of(context).size.width * 0.8, 0),
            color: Pallete.dark3,
          ),
          table("Jenis Transaksi", "Tukat Poin"),
          table("Nama VOucher", "Voucher 5.000 E-Wallet Dana"),
          table("Nomor Hp", "087722998132")
        ],
      ),
    );
  }
}
