import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Pallete.light3,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            IconlyLight.arrow_left,
            size: 24.0,
            color: Pallete.dark1,
          ),
        ),
      ),
    );
  }
}
