import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/models/report_model.dart';

class RiwayatPelaporanCard extends StatelessWidget {
  final ReportModel item;
  const RiwayatPelaporanCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: item.status == "ditolak"
                ? Pallete.errorBackground
                : const Color(0xffE2FEE1),
            shape: BoxShape.circle),
        child: Image.asset(
          "assets/images/tumpukan_sampah.png",
          width: 50,
        ),
      ),
      title: Text(
        item.reportType == "tumpukan sampah"
            ? "Tumpukan Sampah"
            : "Pelanggaran Sampah",
        style: ThemeFont.bodyNormalSemiBold,
      ),
      subtitle: Text(
        DateFormat('dd MMMM yyyy | HH.mm').format(item.createAt),
        style:
            ThemeFont.bodySmallRegular.copyWith(color: Pallete.textSecondary),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: item.status == "ditolak"
              ? Pallete.errorBackground
              : const Color(0xffE2FEE1),
        ),
        child: Text(
          item.status == "perlu ditinjau"
              ? "Proses"
              : item.status[0].toUpperCase() + item.status.substring(1),
          style: ThemeFont.bodySmallSemiBold.copyWith(
              color: item.status == "ditolak" ? Pallete.error : Pallete.main),
        ),
      ),
    );
  }
}
