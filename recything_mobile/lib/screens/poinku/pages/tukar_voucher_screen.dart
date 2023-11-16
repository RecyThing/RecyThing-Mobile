import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/forms/success_screen.dart';

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
        padding: const EdgeInsets.all(16),
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
                child: MainButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Tujuan Sudah Benar?",
                                    style: ThemeFont.interText.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Voucher/Saldo E-wallet akan dikirim ke tujuan yang kamu isi. Kesalahan pengisian diluar tanggung jawab kami.",
                                    style: ThemeFont.interText.copyWith(
                                        fontSize: 16,
                                        color: Pallete.textSecondary),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.33,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor: Pallete.main,
                                              padding: const EdgeInsets.all(16),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    8), // Ganti dengan radius yang Anda inginkan
                                              ),
                                              side: const BorderSide(
                                                  color: Pallete.main),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Kembali")),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.33,
                                          child: MainButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SuccessScreen(
                                                                title:
                                                                    "Selamat",
                                                                subtitle:
                                                                    "Selamat kamu berhasil menukarkan poin dengan voucher e-wallet dana, mohon ditunggu voucher kamu segera kami proses.")));
                                              },
                                              child: Text(
                                                "Lanjutkan",
                                                style: ThemeFont.heading6Reguler
                                                    .copyWith(
                                                        color: Pallete
                                                            .textMainButton,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              )))
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Konfirmasi",
                      style: ThemeFont.heading6Reguler.copyWith(
                          color: Pallete.textMainButton,
                          fontWeight: FontWeight.w700),
                    )))
          ],
        ),
      ),
    );
  }
}
