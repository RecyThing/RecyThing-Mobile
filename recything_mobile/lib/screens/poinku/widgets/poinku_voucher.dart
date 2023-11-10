import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class PoinkuVoucher extends StatelessWidget {
  const PoinkuVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detailVoucher');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Pallete.light3, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/voucher.png",
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Voucher 5.000 E-Wallet Dana",
                            style: ThemeFont.interText.copyWith(fontSize: 16),
                            overflow: TextOverflow.visible,
                          ),
                          Text(
                            "5.200 Poin",
                            style: ThemeFont.interText.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: DashedLine(
              path: Path()
                ..cubicTo(
                    0, 0, 0, 1, MediaQuery.of(context).size.width * 0.8, 0),
              color: Pallete.dark3,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Pallete.light3, borderRadius: BorderRadius.circular(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Berlaku sampai :",
                          style: ThemeFont.interText
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        "20 Oktober 2023",
                        style: ThemeFont.interText
                            .copyWith(color: Pallete.textSecondary),
                      )
                    ],
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: MainButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "assets/icons/profile/lencana.png",
                                            color: Pallete.secondary,
                                            width: 24,
                                          ),
                                          Text(
                                            "Tukarkan Voucher Ini?",
                                            style: ThemeFont.interText.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Kamu yakin ingin Menukarkan Voucher dana menggunakan point?",
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.33,
                                                child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Pallete.main,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8), // Ganti dengan radius yang Anda inginkan
                                                      ),
                                                      side: const BorderSide(
                                                          color: Pallete.main),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Batal")),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.33,
                                                  child: MainButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/tukarVoucher');
                                                      },
                                                      text: "Tukar"))
                                            ],
                                          )
                                        ],
                                      ),
                                    )));
                          },
                          text: "Tukar"))
                ]),
          )
        ],
      ),
    );
  }
}
