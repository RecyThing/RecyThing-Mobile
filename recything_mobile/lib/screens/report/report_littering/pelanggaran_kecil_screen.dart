import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/berhasil_bergabung_screen.dart';
import 'package:recything_mobile/screens/report/widget/maps_report_screen.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class PelanggaranKecilScreen extends StatefulWidget {
  const PelanggaranKecilScreen({super.key});

  @override
  State<PelanggaranKecilScreen> createState() => _PelanggaranKecilScreenState();
}

class _PelanggaranKecilScreenState extends State<PelanggaranKecilScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      dateController.text = picked.toString();
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      if (mounted) {
        timeController.text = picked.format(context);
      }
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  Text(
                    "Pelanggaran Skala Kecil",
                    style: ThemeFont.heading6Reguler,
                  ),
                  const SizedBox(width: 40)
                ],
              ),
            ),
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
                                  builder: (context) => MapsReportScreen(
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
                  const MainTextField(
                    label: "Cth: Sebelah Masjid Nawawi",
                    prefixIcon: IconlyLight.location,
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
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Icon(IconlyLight.calendar),
                                    const SizedBox(width: 12),
                                    Text("Tanggal",
                                        style: ThemeFont.bodyNormalReguler),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 120,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await _selectDate(context);
                                    },
                                    child: MainTextField(
                                      controller: dateController,
                                      enabled: false,
                                      hintText: "Tanggal",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(IconlyLight.time_circle),
                                    const SizedBox(width: 12),
                                    Text("Jam",
                                        style: ThemeFont.bodyNormalReguler),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 120,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await _selectTime(context);
                                    },
                                    child: MainTextField(
                                      controller: timeController,
                                      enabled: false,
                                      hintText: "00:00",
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
                  Text(
                    "Bukti Foto / Video",
                    style: ThemeFont.bodySmallMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Pallete.dark4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Pallete.dark4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Format file: JPG , PNG, MP4",
                    style: ThemeFont.bodySmallRegular
                        .copyWith(color: Pallete.dark3),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Maksimum file: 20 Mb",
                    style: ThemeFont.bodySmallRegular
                        .copyWith(color: Pallete.dark3),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      Expanded(
                        child: MainButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const BerhasilBergabungScreen(),
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
