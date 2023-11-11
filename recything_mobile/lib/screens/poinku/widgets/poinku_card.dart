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

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Selamat",
                      style: ThemeFont.heading3Bold
                          .copyWith(color: Pallete.secondary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: RichText(
                          text: TextSpan(
                              text: "Kamu dapat ",
                              style: ThemeFont.bodyMediumBold
                                  .copyWith(color: Pallete.dark1),
                              children: [
                            TextSpan(
                                text: "150 ",
                                style: ThemeFont.bodyMediumBold
                                    .copyWith(color: Pallete.secondary)),
                            TextSpan(
                                text: "Koin! ",
                                style: ThemeFont.bodyMediumBold
                                    .copyWith(color: Pallete.dark1)),
                          ])),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Kumpulkan ",
                            style: ThemeFont.bodySmallRegular
                                .copyWith(color: Pallete.dark1),
                            children: [
                          TextSpan(
                              text: "5 ",
                              style: ThemeFont.bodySmallRegular
                                  .copyWith(color: Pallete.secondary)),
                          TextSpan(
                              text: "Hari lagi dapatkan ",
                              style: ThemeFont.bodySmallRegular
                                  .copyWith(color: Pallete.dark1)),
                          TextSpan(
                              text: "1750 ",
                              style: ThemeFont.bodySmallRegular
                                  .copyWith(color: Pallete.secondary)),
                          TextSpan(
                              text: "Koin ",
                              style: ThemeFont.bodySmallRegular
                                  .copyWith(color: Pallete.dark1)),
                        ])),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        "assets/images/koin.png",
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: MainButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Oke",
                            style: ThemeFont.bodySmallSemiBold
                                .copyWith(color: Pallete.textMainButton),
                          )),
                    )
                  ],
                ),
              ));
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
