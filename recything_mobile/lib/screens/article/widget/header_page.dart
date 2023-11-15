import 'package:flutter/material.dart';

import '../theme/text_style.dart';

class HeaderPageWidget extends StatelessWidget {
  final String title;

  const HeaderPageWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        SizedBox(
          height: 40,
          width: 328,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/icons/icon_back_button.png'),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 21,
                width: 160,
                child: Text(
                  title,
                  style: ThemeText().heading6Medium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 40,
              )
            ],
          ),
        ),
      ],
    );
  }
}