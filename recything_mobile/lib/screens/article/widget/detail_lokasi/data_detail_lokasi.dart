import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class DataDetailLokasiWidget extends StatelessWidget {
  const DataDetailLokasiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '420 M',
          style: ThemeFont.interText.copyWith(
              fontSize: 12, fontWeight: FontWeight.w500, color: Pallete.main),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 4),
        Text(
          'Ruko Gajah Mada Padang',
          style: ThemeFont.bodyNormalSemiBold,
        ),
        const SizedBox(height: 4),
        Text(
          'Jl. Gajah Mada, Kp. Olo, Kec. Naggalo, Kota Padang, Sumatera Barat',
          style: ThemeFont.bodySmallRegular,
        ),
        const SizedBox(height: 4),
        const Divider(),
        const SizedBox(height: 4),
        Text(
          'Jam Operasional',
          style: ThemeFont.bodySmallSemiBold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Senin',
              style: ThemeFont.bodySmallRegular,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallRegular,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Selasa',
              style: ThemeFont.bodySmallRegular,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallRegular,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rabu',
              style: ThemeFont.bodySmallRegular,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallRegular,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kamis',
              style: ThemeFont.bodySmallRegular,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallRegular,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jumat',
              style: ThemeFont.bodySmallSemiBold,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallSemiBold,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sabtu',
              style: ThemeFont.bodySmallRegular,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallRegular,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Minggu',
              style: ThemeFont.bodySmallRegular,
            ),
            Text(
              '09:00 - 18:30 (WIB)',
              style: ThemeFont.bodySmallRegular,
            ),
          ],
        )
      ],
    );
  }
}
