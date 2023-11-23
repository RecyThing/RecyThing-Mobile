import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recything_mobile/constants/pallete.dart';

class TimePickerWWidget extends StatefulWidget {
  const TimePickerWWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWWidgetState createState() => _TimePickerWWidgetState();
}

class _TimePickerWWidgetState extends State<TimePickerWWidget> {
  TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    timeInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16),
      child: Center(
        child: TextField(
          controller: timeInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Pallete.info),
            ),
            focusColor: Pallete.info,
            hintText: '00:00',
          ),
          style: ThemeFont.bodySmall.copyWith(
            color: Pallete.dark3,
            fontWeight: FontWeight.w500,
          ),
          readOnly: true,
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null) {
              print(pickedTime.format(context));
              DateTime currentTime = DateTime.now();
              DateTime parsedTime = DateTime(
                currentTime.year,
                currentTime.month,
                currentTime.day,
                pickedTime.hour,
                pickedTime.minute,
              );

              print(parsedTime);
              String formattedTime = DateFormat('hh:mm a').format(parsedTime);

              setState(() {
                timeInput.text = formattedTime;
              });
            } else {
              print('Time is not selected');
            }
          },
        ),
      ),
    );
  }
}
