import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/report-rubbish/detail_riwayat_pelaporan_screen.dart';
import 'package:recything_mobile/screens/report/widget/add_media_button.dart';
import 'package:recything_mobile/screens/report/widget/checkbox_report.dart';
import 'package:recything_mobile/screens/report/widget/text_field_report.dart';


class ReportRubbishScreen extends StatefulWidget {
  final String? locationAddress;
  const ReportRubbishScreen({
    Key? key,
    this.locationAddress,
  }) : super(key: key);

  @override
  State<ReportRubbishScreen> createState() => _ReportRubbishScreenState();
}

class _ReportRubbishScreenState extends State<ReportRubbishScreen> {
  bool isCheckedKering = false;
  bool isCheckedBasah = false;

  String? lokasiPatokanText;
  String? kondisiSampahText;
  String? lokasiTumpukanText;

  ImagePickerButton imagePickerButton = ImagePickerButton(
    onImagesSelected: (List<XFile>? selectedImages) {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tumpukan Sampah',
          style: ThemeFont.heading6Medium,
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .76,
                        child: TextFieldReport(
                          label: 'Lokasi Tumpukan',
                          labelStyle: ThemeFont.bodySmallMedium.copyWith(
                            color: Pallete.dark3,
                          ),
                          hinttext: 'Lokasi Tumpukan',
                          hintStyle: ThemeFont.bodySmallMedium.copyWith(
                            color: Pallete.dark3,
                          ),
                          onChanged: (value) {
                            setState(() {
                              lokasiTumpukanText = value;
                            });
                          },
                          prefixIcon: IconlyLight.location,
                          maxLines: 1,
                          controller: TextEditingController(
                              text: widget.locationAddress ?? ""),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/maps-report");
                        },
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                              color: Pallete.main,
                              borderRadius: BorderRadius.circular(12)),
                          child: Image.asset("assets/images/location_map.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Tambah Lokasi Patokan',
                    style: ThemeFont.bodySmallMedium,
                  ),
                  TextFieldReport(
                    hinttext: 'Cth: Sebelah Masjid Nawawi',
                    hintStyle: ThemeFont.bodySmallMedium.copyWith(
                      color: Pallete.dark3,
                    ),
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
                    style: ThemeFont.bodyNormalReguler,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      CheckboxReport(
                        label: 'Sampah Kering',
                        onChanged: (bool? value) {
                          setState(
                            () {
                              isCheckedKering = value!;
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CheckboxReport(
                        label: 'Sampah Basah',
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedBasah = value!;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Ceritakan Kondisi Sampah',
                      style: ThemeFont.bodySmallMedium),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFieldReport(
                    maxLines: 5,
                    hinttext:
                        'Cth: Saya melihat tumpukan sampah yang sangat banyak, sampah sangat bercampur basah dan kering',
                    hintStyle: ThemeFont.bodySmallMedium,
                    onChanged: (value) {
                      setState(() {
                        kondisiSampahText = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Bukti Foto / Video',
                      style: ThemeFont.bodyNormalReguler),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      imagePickerButton,
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
                    child: SizedBox(
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
                                  lokasiTumpukanText: lokasiTumpukanText,
                                ),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.main,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Kirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
