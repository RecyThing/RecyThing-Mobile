import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  List<XFile>? selectedImages = []; //menyimpan gambar yang dipilih

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImages =
        await imagePicker.pickMultiImage(); //mengambil gambar dari galeri

    if (pickedImages != null) {
      setState(() {
        selectedImages = pickedImages;
      });
    }
  }

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
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  const Text('Sampah Kering')
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
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  const Text('Sampah Basah')
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Ceritakan Kondisi Sampah',
                style: TextStyle(
                    fontSize: ThemeFont.bodyNormal.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 4,
              ),
              const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintText:
                      'Cth: Saya melihat tumpukan sampah yang sangat banyak, sampah sangat bercampur basah dan kering',
                  focusColor: Pallete.dark1,
                  labelStyle: TextStyle(color: Pallete.dark2),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Bukti Foto / Video',
                style: TextStyle(
                    fontSize: ThemeFont.bodyNormal.fontSize,
                    fontWeight: FontWeight.w400),
              ),
              if (selectedImages != null && selectedImages!.isNotEmpty)
                Column(
                  children: [
                    for (final image in selectedImages!)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.file(
                          File(image.path),
                        ),
                      )
                  ],
                ),
              ElevatedButton(
                onPressed: pickImage,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Maksimum file: 20 MB',
                style: TextStyle(
                    fontSize: ThemeFont.bodySmall.fontSize,
                    fontWeight: ThemeFont.bodySmall.fontWeight,
                    color: Pallete.dark3),
              ),
              MainButton(
                onPressed: () {},
                child: Text(
                  "Kirim",
                  style: ThemeFont.heading6.copyWith(
                      color: Pallete.textMainButton,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ));
  }
}
