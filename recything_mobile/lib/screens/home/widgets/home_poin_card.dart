import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class HomePoinCard extends StatelessWidget {
  const HomePoinCard({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Poinku",
                style: ThemeFont.interText,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Pallete.secondaryDarker),
                child: Text(
                  "Gold",
                  style: ThemeFont.interText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Pallete.textMainButton),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "500.992",
            style: ThemeFont.interText
                .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Pallete.main,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Ganti dengan radius yang Anda inginkan
                      ),
                      side: const BorderSide(color: Pallete.main),
                    ),
                    onPressed: () {},
                    child: const Text("Riwayat")),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MainButton(onPressed: () {}, text: "Tukar Poin"))
            ],
          )
        ],
      ),
    );
  }
}
