import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/forms/text_field_without_icon.dart';

class ReportRubbishScreen extends StatefulWidget {
  const ReportRubbishScreen({super.key});

  @override
  State<ReportRubbishScreen> createState() => _ReportRubbishScreenState();
}

class _ReportRubbishScreenState extends State<ReportRubbishScreen> {
  bool isCheckedKering = false;
  bool isCheckedBasah = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tumpukan Sampah'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: MainTextField(
                      label: 'Lokasi Sampah',
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.main,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Image.asset(
                        'assets/images/location_map.png',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Tambah Lokasi Patokan',
                style: TextStyle(
                    fontSize: ThemeFont.bodySmall.fontSize,
                    fontWeight: FontWeight.w500),
              ),
              const TextFieldWithoutIcon(label: 'Cth: Sebelah Masjid Nawawi'),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Jenis Sampah',
                style: TextStyle(
                    fontSize: ThemeFont.bodyNormal.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isCheckedKering,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedKering = value!;
                      });
                    },
                    activeColor: Pallete.main,
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  Text('Sampah Kering')
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isCheckedBasah,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedBasah = value!;
                      });
                    },
                    activeColor: Pallete.main,
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                  Text('Sampah Basah')
                ],
              )
            ],
          ),
        ));
  }
}
