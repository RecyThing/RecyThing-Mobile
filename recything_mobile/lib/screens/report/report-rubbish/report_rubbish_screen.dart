import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_mobile/bloc/post_report/post_report_rubbish_cubit.dart';
import 'package:recything_mobile/bloc/post_report/post_report_rubbish_state.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/widget/image_picker_button.dart';
import 'package:recything_mobile/screens/report/widget/checkbox_report.dart';
import 'package:recything_mobile/screens/report/widget/maps_report_screen.dart';
import 'package:recything_mobile/screens/report/widget/text_field_report.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/success_screen.dart';

class ReportRubbishScreen extends StatefulWidget {
  final String? locationAddress;
  final double? latitude;
  final double? longitude;

  const ReportRubbishScreen({
    Key? key,
    this.locationAddress,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  @override
  State<ReportRubbishScreen> createState() => _ReportRubbishScreenState();
}

class _ReportRubbishScreenState extends State<ReportRubbishScreen> {
  List<XFile>? selectedImages;

  TextEditingController lokasiPatokanController = TextEditingController();
  TextEditingController kondisiSampahController = TextEditingController();

  late ImagePickerButton imagePickerButton;

  @override
  void initState() {
    super.initState();
    imagePickerButton = ImagePickerButton(
      onImagesSelected: (List<XFile>? images) {
        setState(() {
          selectedImages = images;
        });
      },
    );
  }

  List<File>? convertImagesToFiles(List<XFile>? selectedImages) {
    if (selectedImages == null) return null;

    return selectedImages.map((image) => File(image.path)).toList();
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldReport(
                            label: 'Lokasi Tumpukan',
                            labelStyle: ThemeFont.bodySmallMedium.copyWith(
                              color: Pallete.dark3,
                            ),
                            hintText: 'Lokasi Tumpukan',
                            hintStyle: ThemeFont.bodySmallMedium.copyWith(
                              color: Pallete.dark3,
                            ),
                            prefixIcon: IconlyLight.location,
                            maxLines: 1,
                            controller: TextEditingController(
                              text: widget.locationAddress ?? "",
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MapsReportScreen(
                                      reportType: 'rubbish'),
                                ),
                              );
                            },
                            child: Image.asset("assets/images/map_icon.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Tambah Lokasi Patokan',
                    style: ThemeFont.bodySmallMedium,
                  ),
                  const SizedBox(height: 4),
                  TextFieldReport(
                    controller: lokasiPatokanController,
                    hintText: 'Cth: Sebelah Masjid Nawawi',
                    hintStyle: ThemeFont.bodySmallMedium.copyWith(
                      color: Pallete.dark3,
                    ),
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
                          context
                              .read<PostReportRubbishCubit>()
                              .toggleCheckboxKering(value!);
                          print('Kering = ' +
                              context
                                  .read<PostReportRubbishCubit>()
                                  .isCheckedKering
                                  .toString());
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CheckboxReport(
                        label: 'Sampah Basah',
                        onChanged: (bool? value) {
                          context
                              .read<PostReportRubbishCubit>()
                              .toggleCheckboxBasah(value!);
                          print('Basah = ' +
                              context
                                  .read<PostReportRubbishCubit>()
                                  .isCheckedBasah
                                  .toString());
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
                    controller: kondisiSampahController,
                    maxLines: 5,
                    hintText:
                        'Cth: Saya melihat tumpukan sampah yang sangat banyak, sampah sangat bercampur basah dan kering',
                    hintStyle: ThemeFont.bodySmallMedium,
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
                    height: 8,
                  ),
                  Text(
                    'Format file: JPG, PNG, MP4',
                    style: ThemeFont.bodySmallRegular.copyWith(
                      color: Pallete.dark3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Maksimum file: 20 MB',
                    style: ThemeFont.bodySmallRegular.copyWith(
                      color: Pallete.dark3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BlocListener<PostReportRubbishCubit,
                            PostReportRubbishState>(
                          listener: (context, state) {
                            if (state is PostReportRubbishSuccess) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SuccessScreen(
                                    title: 'Laporan Terkirim',
                                    subtitle:
                                        'Terimakasih telah berkontribusi untuk melaporkan pelanggaran dan kondisi sampah yang kamu temui, kami sangat mengapresiasi usaha anda.',
                                  ),
                                ),
                              );
                            }
                          },
                          child: MainButton(
                            child: BlocBuilder<PostReportRubbishCubit,
                                PostReportRubbishState>(
                              builder: (context, state) {
                                if (state is PostReportRubbishLoading) {
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                } else if (state is PostReportRubbishFailed) {
                                  return Text(state.message);
                                } else {
                                  return Text(
                                    "Kirim",
                                    style: ThemeFont.heading6Bold.copyWith(
                                      color: Pallete.textMainButton,
                                    ),
                                  );
                                }
                              },
                            ),
                            onPressed: () {
                              context.read<PostReportRubbishCubit>().reports(
                                    context: context,
                                    reportType: "tumpukan sampah",
                                    location: widget.locationAddress ?? "",
                                    latitude: widget.latitude ?? 0.0,
                                    longitude: widget.longitude ?? 0.0,
                                    addressPoint: lokasiPatokanController.text,
                                    trashType: context
                                        .read<PostReportRubbishCubit>()
                                        .getTrashType(),
                                    desc: kondisiSampahController.text,
                                    images: selectedImages!,
                                  );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
