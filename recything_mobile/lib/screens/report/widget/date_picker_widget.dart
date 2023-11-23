import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recything_mobile/constants/pallete.dart'; // Add this line to import the intl package

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // height: 150,
      child: TextField(
        controller: dateInput,
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
          hintText: 'Tanggal',
        ),
        style: ThemeFont.bodySmall.copyWith(
          color: Pallete.dark3,
          fontWeight: FontWeight.w500,
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (pickedDate != null) {
            print(pickedDate);
            String formattedDate =
                DateFormat('yyyy-MM-dd').format(pickedDate);
            print(formattedDate);

            setState(() {
              dateInput.text = formattedDate;
            });
          } else {
            print('Date is not selected');
          }
        },
      ),
    );
  }
}
