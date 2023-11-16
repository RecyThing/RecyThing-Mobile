import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/detail_riwayat_pelaporan_screen.dart';
import 'package:recything_mobile/screens/report/report_rubbish_maps_screen.dart';
import 'package:recything_mobile/screens/report/widget/text_field_report.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class ReportRubbishScreen extends StatefulWidget {
  const ReportRubbishScreen({super.key});

  @override
  State<ReportRubbishScreen> createState() => _ReportRubbishScreenState();
}

class _ReportRubbishScreenState extends State<ReportRubbishScreen> {
  bool isCheckedKering = false;
  bool isCheckedBasah = false;

  List<XFile>? selectedImages = []; //menyimpan gambar yang dipilih
  String? _locationAddress; //menyimpan alamat dari maps

  String? lokasiPatokanText;
  String? kondisiSampahText;

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImages =
        await imagePicker.pickMultiImage(); //mengambil gambar dari galeri

    // menampilkan gambarnya
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
          title: Text(
            'Tumpukan Sampah',
            style: ThemeFont.heading6Medium.copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .76,
                          child: const MainTextField(
                            label: 'Lokasi Tumpukan',
                            prefixIcon: IconlyLight.location,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/maps-report");
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            child:
                                Image.asset("assets/images/location_map.png"),
                            decoration: BoxDecoration(
                                color: Pallete.main,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
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
                  TextFieldReport(
                    hinttext: 'Cth: Sebelah Masjid Nawawi',
                    onChanged: (value) {
                      setState(() {
                        lokasiPatokanText = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Jenis Sampah',
                    style: TextStyle(
                        fontSize: ThemeFont.bodyNormalReguler.fontSize,
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
                      Text(
                        'Sampah Kering',
                        style: TextStyle(
                            color:
                                isCheckedKering ? Pallete.main : Pallete.dark3),
                      )
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
                      Text(
                        'Sampah Basah',
                        style: TextStyle(
                            color:
                                isCheckedBasah ? Pallete.main : Pallete.dark3),
                      )
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
                  TextFieldReport(
                    maxLines: 5,
                    hinttext:
                        'Cth: Saya melihat tumpukan sampah yang sangat banyak, sampah sangat bercampur basah dan kering',
                    onChanged: (value) {
                      setState(() {
                        kondisiSampahText = value;
                      });
                    },
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
                  Row(
                    children: [
                      if (selectedImages != null && selectedImages!.isNotEmpty)
                        for (final image in selectedImages!)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Image.file(
                              File(image.path),
                              width: 80,
                              height: 80,
                            ),
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
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Maksimum file: 20 MB',
                    style: ThemeFont.bodySmallRegular.copyWith(
                        color: Pallete.dark3, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailRiwayatPelaporanScreen(
                                  lokasiPatokanText: lokasiPatokanText,
                                  kondisiSampahText: kondisiSampahText,
                                ),
                              ));
                        },
                        child: const Text(
                          'Kirim',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.main,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
