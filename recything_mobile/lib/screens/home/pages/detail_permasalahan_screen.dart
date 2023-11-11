import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class DetailPermasalahanScreen extends StatelessWidget {
  const DetailPermasalahanScreen({super.key});

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
          "Detail Permasalahan",
          style: ThemeFont.heading6Medium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cara mengelola sampah",
              style: ThemeFont.bodyNormalSemiBold,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Cara mengelola sampah dapat melibatkan beberapa langkah, termasuk:\n1.Pemilahan Sampah: Pisahkan sampah menjadi kategori berbeda, seperti organik, kertas, plastik, logam, dan sebagainya.\n2.Daur Ulang: Maksimalkan daur ulang dengan mengumpulkan, mendaur ulang, dan menggunakan kembali bahan-bahan yang bisa didaur ulang.\n3.Pengomposan: Buat kompos dari sisa makanan dan limbah organik untuk menghasilkan pupuk alami.\n4.Pengurangan Sampah: Kurangi penggunaan kantong plastik sekali pakai dan barang-barang sekali pakai.",
              style: ThemeFont.bodySmallRegular,
            ),
            const Expanded(child: SizedBox()),
            Text(
              "Masih butuh bantuan?",
              style: ThemeFont.bodySmallSemiBold,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MainButton(
                  onPressed: () {},
                  child: Text(
                    "Hubungi Kami",
                    style: ThemeFont.heading6Reguler.copyWith(
                        color: Pallete.textMainButton,
                        fontWeight: FontWeight.w700),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
