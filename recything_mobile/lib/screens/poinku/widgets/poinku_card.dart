import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';

class PoinkuCard extends StatefulWidget {
  const PoinkuCard({super.key});

  @override
  State<PoinkuCard> createState() => _PoinkuCardState();
}

class _PoinkuCardState extends State<PoinkuCard> {
  double dividerWidth = 0;
  int clickCount = 0;

  void _onTukarPoinClicked() {
    setState(() {
      if (clickCount == 0) {
        dividerWidth = 0;
      } else {
        dividerWidth += 0.15;
      }
      clickCount++;
    });
  }

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
          Text(
            "Point",
            style: ThemeFont.interText
                .copyWith(fontWeight: FontWeight.w600, color: Pallete.dark1),
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
          Stack(
            children: [
              Positioned(
                top: 13,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Divider(
                    thickness: 4,
                  ),
                ),
              ),
              Positioned(
                top: 13,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (clickCount > 0 ? dividerWidth : 0),
                  child: const Divider(
                    thickness: 4,
                    color: Pallete.warning,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 22,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: clickCount > index
                                ? Pallete.warning
                                : Pallete.dark3),
                        child: clickCount > index
                            ? const Icon(
                                Icons.check,
                                color: Pallete.textMainButton,
                                size: 22,
                              )
                            : Text(
                                "${10 * (index + 1)}",
                                style: ThemeFont.interText
                                    .copyWith(color: Pallete.textMainButton),
                              ),
                      ),
                      Text(
                        "Hari ${index + 1}",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MainButton(
                  onPressed: _onTukarPoinClicked,
                  child: Text(
                    "Kumpulkan",
                    style: ThemeFont.heading6Reguler.copyWith(
                        color: Pallete.textMainButton,
                        fontWeight: FontWeight.w700),
                  )))
        ],
      ),
    );
  }
}
