import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/berhasil_bergabung_screen.dart';
import 'package:recything_mobile/screens/report/widget/date_picker_widget.dart';
import 'package:recything_mobile/screens/report/widget/image_picker_button.dart';
import 'package:recything_mobile/screens/report/widget/laporan_berhasil_widget.dart';
import 'package:recything_mobile/screens/report/widget/maps_report_screen.dart';
import 'package:recything_mobile/screens/report/widget/text_field_report.dart';
import 'package:recything_mobile/screens/report/widget/time_picker_widget.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class PelanggaranKecilScreen extends StatefulWidget {
  const PelanggaranKecilScreen({super.key});

  @override
  State<PelanggaranKecilScreen> createState() => _PelanggaranKecilScreenState();
}

class _PelanggaranKecilScreenState extends State<PelanggaranKecilScreen> {
  ImagePickerButton imagePickerButton = ImagePickerButton(
    onImagesSelected: (List<XFile>? selectedImages) {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //nggak teganti warna putih
      appBar: AppBar(
        title: Text(
          'Pelanggaran Skala Kecil',
          style: ThemeFont.heading6Medium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const Expanded(
                          child: MainTextField(
                            label: "Lokasi Pelanggaran",
                            prefixIcon: IconlyLight.location,
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
                                      reportType: 'pelanggaran-kecil'),
                                ),
                              );
                              // Navigator.pushNamed(context, "/maps-report");
                            },
                            child: Image.asset("assets/images/map_icon.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Tambah Lokasi Patokan",
                    style: ThemeFont.bodySmallMedium,
                  ),
                  const SizedBox(height: 8),
                  TextFieldReport(
                    hinttext: 'Cth: Sebelah Masjid Nawawi',
                    hintStyle: ThemeFont.bodySmallMedium.copyWith(
                      color: Pallete.dark3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Waktu Kejadian",
                    style: ThemeFont.bodySmallMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset("assets/images/littering_time_form.png"),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(IconlyLight.calendar),
                                      const SizedBox(width: 12),
                                      Text("Tanggal",
                                          style: ThemeFont.bodyNormalReguler),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 120,
                                  child: DatePickerWidget(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Row(
                                    children: [
                                      const Icon(IconlyLight.time_circle),
                                      const SizedBox(width: 12),
                                      Text("Jam",
                                          style: ThemeFont.bodyNormalReguler),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 120,
                                  child: TimePickerWWidget(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Ceritakan Detail Kejadian",
                    style: ThemeFont.bodySmallMedium,
                  ),
                  const SizedBox(height: 8),
                  const MainTextField(
                    hintText:
                        "Cth: Saya melihat Seseorang membuang sampah sembarangan ke sungai",
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
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
                        color: Pallete.dark3, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Maksimum file: 20 MB',
                    style: ThemeFont.bodySmallRegular.copyWith(
                        color: Pallete.dark3, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      Expanded(
                        child: MainButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const LaporanBerhasilWidget(),
                            ));
                          },
                          child: Text(
                            "Kirim",
                            style: ThemeFont.heading6Reguler
                                .copyWith(color: Colors.white),
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
