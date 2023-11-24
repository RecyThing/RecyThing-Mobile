import 'package:flutter/material.dart';

class BottomSheetWidget {
  final String title;
  final String subtitle;

  BottomSheetWidget({
    required this.title,
    required this.subtitle,
  });

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              ListTile(
                title: Text(title),
                // onTap: () {
                //   Navigator.pop(context);
                // },
              ),
              ListTile(
                title: Text(subtitle),
                // onTap: () {
                //   Navigator.pop(context);
                // },
              )
            ],
          );
        });
  }
}
