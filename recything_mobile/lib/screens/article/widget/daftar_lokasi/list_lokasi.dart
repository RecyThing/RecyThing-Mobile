import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/models/drop_points_model.dart';
import 'package:recything_mobile/screens/article/page/detail_lokasi.dart';
import 'package:recything_mobile/screens/article/theme/color_style.dart';

class ListLokasiWidget extends StatelessWidget {
  final DropPointsModel item;
  final int no;
  const ListLokasiWidget({super.key, required this.item, required this.no});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 132,
        decoration: BoxDecoration(
          color: ThemeColor().whiteColor,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 17,
              // width: 50,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: ThemeColor().whiteColor,
                // border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Text(
                '$no M',
                style: ThemeFont.interText
                    .copyWith(color: Pallete.main, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: ThemeFont.bodySmallSemiBold
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.address,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailLokasiScreen(item: item)));
              },
            )
          ],
        ),
      ),
    );
  }
}
