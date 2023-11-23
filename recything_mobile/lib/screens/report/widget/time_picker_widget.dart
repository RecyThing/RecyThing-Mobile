import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      padding: const EdgeInsets.all(16),
      child: Center(
        child: TextField(
          controller: timeInput,
          decoration: const InputDecoration(hintText: "00:00"),
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
              String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

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
