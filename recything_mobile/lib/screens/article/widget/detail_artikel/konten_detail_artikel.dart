import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class KontenDetailArtikelWidget extends StatelessWidget {
  const KontenDetailArtikelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3 Cara mendaur ulang sampah PLASTIK!',
            style: ThemeFont.bodyLargeBold,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      'Plastik',
                      style: ThemeFont.bodySmallRegular
                          .copyWith(color: Pallete.main),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      '|',
                      style: TextStyle(color: Pallete.dark4),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '22 Oktober 2023',
                      style: ThemeFont.bodySmallRegular
                          .copyWith(color: Pallete.dark3),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        'assets/icons/icon_like_outline.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '182',
                      style: ThemeFont.bodySmallRegular
                          .copyWith(color: Pallete.dark3),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.share_outlined),
                    const SizedBox(width: 5),
                    Text(
                      '182',
                      style: ThemeFont.bodySmallRegular
                          .copyWith(color: Pallete.dark3),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 8),
          Text(
            'Sampah plastik adalah masalah serius yang merusak lingkungan kita. Plastik tidak mudah terurai, dan banyak jenisnya akhirnya mencemari lautan, hutan, dan daratan. Namun, dengan berpartisipasi dalam praktik daur ulang plastik, kita dapat berkontribusi untuk mengurangi dampak negatifnya terhadap bumi. Berikut adalah tiga cara sederhana untuk mendaur ulang sampah plastik yang dapat membantu menyelamatkan lingkungan:',
            style: ThemeFont.bodySmallRegular.copyWith(color: Pallete.dark1),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 8),
          Text(
            "1. Mencari Tempat Pengumpulan Daur Ulang Plastik",
            style: ThemeFont.bodySmallSemiBold.copyWith(color: Pallete.dark1),
          ),
          Text(
            'Langkah pertama adalah mencari tempat pengumpulan daur ulang plastik di sekitar Anda. Banyak komunitas memiliki fasilitas daur ulang yang menerima berbagai jenis plastik, termasuk botol, wadah, dan kemasan plastik lainnya. Informasi tentang lokasi pengumpulan ini biasanya dapat ditemukan di situs web pemerintah setempat atau lembaga daur ulang. Ketika Anda mengetahui lokasinya, Anda dapat mulai mengumpulkan plastik Anda.',
            style: ThemeFont.bodySmallRegular.copyWith(color: Pallete.dark1),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 8),
          Text(
            '2. Pisahkan Plastik Menurut Jenisnya',
            style: ThemeFont.bodySmallSemiBold.copyWith(color: Pallete.dark1),
          ),
          Text(
            'Pisahkan sampah plastik menurut jenisnya. Ini penting karena beberapa jenis plastik lebih mudah didaur ulang daripada yang lain. Biasanya, plastik memiliki label kode daur ulang yang membantu Anda mengidentifikasi jenisnya. Contoh labelnya adalah "PET" untuk botol air minum, "HDPE" untuk botol susu, dan "LDPE" untuk kantong plastik. Dengan memisahkan plastik sesuai dengan jenisnya, Anda mempermudah proses daur ulang.',
            style: ThemeFont.bodySmallRegular.copyWith(color: Pallete.dark1),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
