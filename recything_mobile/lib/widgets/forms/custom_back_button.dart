import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class CustomBackButton extends StatelessWidget {
  // final void Function()? onPressed;
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Pallete.light3,
        ), // You can change the border color and width
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: Pallete.dark1,
          ),
        ),
      ),
    );
  }
}
