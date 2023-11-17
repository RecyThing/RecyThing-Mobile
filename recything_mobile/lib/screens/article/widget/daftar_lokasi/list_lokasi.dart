import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/theme/color_style.dart';

class ListLokasiWidget extends StatelessWidget {
  const ListLokasiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 132,
            decoration: BoxDecoration(
                color: ThemeColor().whiteColor,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 17,
                  // width: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    '420 M',
                    style: ThemeFont.interText.copyWith(
                        color: Pallete.main, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ruko Gajah Mada Padang',
                        style: ThemeFont.bodySmallSemiBold
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Jl. Gajah Mada, Kp. Olo, Kec. Naggalo, Kota Padang",
                        style: ThemeFont.bodySmallRegular.copyWith(
                            color: Pallete.dark3, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Detail Drop Point',
                        style: ThemeFont.bodySmallRegular
                            .copyWith(color: Pallete.main),
                      ),
                      const Icon(
                        IconlyLight.arrow_right_2,
                        color: Pallete.main,
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/detailLokasi');
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
