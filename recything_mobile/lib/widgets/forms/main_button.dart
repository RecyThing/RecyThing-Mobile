import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Pallete.main),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Pallete.textMainButton,
            fontSize: 16,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
