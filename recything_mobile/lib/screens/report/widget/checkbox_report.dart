import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class CheckboxReport extends StatefulWidget {
  final String label;
  
  final void Function(bool?) onChanged;

  const CheckboxReport({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CheckboxReportState createState() => _CheckboxReportState();
}

class _CheckboxReportState extends State<CheckboxReport> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
               isChecked = !isChecked;
              widget.onChanged(isChecked);
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isChecked ? Pallete.main : Pallete.dark3,
              ),
              color: isChecked ? Pallete.main : Colors.transparent,
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              // widget.onChanged(isChecked);
            });
          },
          child: Text(
            widget.label,
            style: TextStyle(
              color: isChecked ? Pallete.main : Pallete.dark3,
              fontSize: ThemeFont.bodyNormalReguler.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
