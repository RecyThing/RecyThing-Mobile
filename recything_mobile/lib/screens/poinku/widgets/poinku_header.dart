import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class PoinkuHeader extends StatelessWidget {
  const PoinkuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 66, 16, 86),
      decoration: const BoxDecoration(
          color: Pallete.main,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/dashboard');
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Pallete.textMainButton)),
            child: const Icon(
              Icons.arrow_back,
              color: Pallete.textMainButton,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        Text(
          "Poinku",
          style: ThemeFont.interText.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallete.textMainButton),
        )
      ]),
    );
  }
}
