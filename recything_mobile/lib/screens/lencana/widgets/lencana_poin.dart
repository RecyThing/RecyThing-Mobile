import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class LencanaPoin extends StatefulWidget {
  final Color color;
  final double nilai;
  const LencanaPoin({super.key, required this.color, required this.nilai});

  @override
  State<LencanaPoin> createState() => _LencanaPoinState();
}

class _LencanaPoinState extends State<LencanaPoin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Poin saat ini",
            style: ThemeFont.bodyNormalSemiBold
                .copyWith(color: Pallete.textSecondary),
          ),
          Text(
            "125.000 Poin",
            style: ThemeFont.heading5Bold,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: LinearProgressIndicator(
              color: widget.color,
              borderRadius: BorderRadius.circular(40),
              value: widget.nilai,
              minHeight: 10,
            ),
          ),
          Text(
            widget.nilai == 1.0
                ? "Poin Anda sudah melewati batas level lencana ini"
                : widget.nilai == 0
                    ? "Poin Anda belum mencukupi untuk lencana ini."
                    : "125.000 Poin lagi untuk menjadi Platinum",
            style: ThemeFont.bodySmallRegular
                .copyWith(color: Pallete.textSecondary),
          ),
        ],
      ),
    );
  }
}
