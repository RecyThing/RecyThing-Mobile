import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class TukatVoucherScreen extends StatefulWidget {
  const TukatVoucherScreen({super.key});

  @override
  State<TukatVoucherScreen> createState() => _TukatVoucherScreenState();
}

class _TukatVoucherScreenState extends State<TukatVoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tukar Voucher Anda",
              style: ThemeFont.interText
                  .copyWith(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text:
                    'Masukkan tujuan nomor penerima untuk melakukan penukaran',
                style: ThemeFont.interText
                    .copyWith(fontSize: 16, color: Pallete.dark3),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Voucher 5.000 E-Wallet Dana',
                    style: ThemeFont.interText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Pallete.dark1),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: MainTextField(
                  label: "Masukan Nomor HP", prefixIcon: Icons.phone_outlined),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MainButton(onPressed: () {}, text: "Konfirmasi"))
          ],
        ),
      ),
    );
  }
}
