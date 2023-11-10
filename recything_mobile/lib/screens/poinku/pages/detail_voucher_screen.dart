import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class DetailVoucherScreen extends StatelessWidget {
  const DetailVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Voucher",
          style: ThemeFont.interText
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/voucher.png",
                width: 220,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 43, 16, 0),
              child: Text(
                "Voucher 5.000 E-Wallet Dana",
                style: ThemeFont.interText
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "5.200 Poin",
                style: ThemeFont.interText.copyWith(
                    color: Pallete.main,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Text("Berlaku sampai : ",
                      style: ThemeFont.interText.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "20 Oktober 2069",
                    style: ThemeFont.interText.copyWith(color: Pallete.dark4),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text("Deskripsi : ",
                  style: ThemeFont.interText.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Voucher 5.000 E-Wallet Dana adalah sebuah hadiah yang dapat kamu tukarkan dengan saldo sebesar 5.000 Rupiah dalam e-wallet Dana. Dengan voucher ini, kamu bisa menikmati bertransaksi dan berbelanja secara online. Nikmati kepraktisan dan kenyamanan berbelanja, serta manfaatkan voucher ini untuk mendukung gaya hidup yang lebih ramah lingkungan. Sebagai pengguna Recything yang aktif, kamu dapat menukarkan poinmu dengan voucher ini dan merasakan manfaatnya dalam aktivitasmu sehari-hari. Segera tukarkan poinmu dan mulai berbelanja dengan lebih hemat!",
                style: ThemeFont.interText.copyWith(color: Pallete.dark3),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                child: MainButton(onPressed: () {}, text: "Tukar"))
          ],
        ),
      ),
    );
  }
}
