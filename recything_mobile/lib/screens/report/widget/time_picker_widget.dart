import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recything_mobile/constants/pallete.dart';

class TimePickerWWidget extends StatefulWidget {
  const TimePickerWWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TimePickerWWidgetState createState() => _TimePickerWWidgetState();
}

class _TimePickerWWidgetState extends State<TimePickerWWidget> {
  TextEditingController timeInput = TextEditingController();
  bool isTimeSelected = false;

  @override
  void initState() {
    timeInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: timeInput,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: Pallete.info),
        ),
        focusColor: Pallete.info,
        hintText: '00:00',
      ),
      style: ThemeFont.bodySmallMedium.copyWith(
        color: isTimeSelected ? Pallete.dark1 : Pallete.dark3,
        fontWeight: FontWeight.w500,
      ),
      readOnly: true,
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (pickedTime != null) {
          DateTime currentTime = DateTime.now();
          DateTime parsedTime = DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );

          String formattedTime = DateFormat('hh:mm a').format(parsedTime);

          setState(() {
            timeInput.text = formattedTime;
          });
        }
      },
    );
  }
}
