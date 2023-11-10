import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ChooseReport extends StatefulWidget {
  const ChooseReport({Key? key}) : super(key: key);

  @override
  _ChooseReportState createState() => _ChooseReportState();
}

class _ChooseReportState extends State<ChooseReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Pelaporan',
          style: ThemeFont.heading6Reguler,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16),
            child: Text(
              'Pilih Jenis Pelaporan',
              style: ThemeFont.heading6Reguler,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/report-rubbish');
            },
            child: buildCard(
              'Tumpukan Sampah',
              'Lapor penumpukan sampah sembarangan.',
              'assets/images/tumpukan_sampah.png',
              const Color(0XFFE2FEE1),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle card tap action
            },
            child: buildCard(
              'Pelanggaran Sampah',
              'Lapor aksi pembuangan sampah sembarangan.',
              'assets/images/pelanggaran_sampah.png',
              const Color(0XFFFEF7E0),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riwayat Pelaporan',
                  style: ThemeFont.heading6Reguler,
                ),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/riwayat.png',
                        width: 100,
                        height: 98,
                      ),
                      const SizedBox(height: 11),
                      Text(
                        'Kamu belum pernah melaporkan',
                        style: TextStyle(
                          color: Pallete.dark3,
                          fontSize: ThemeFont.bodySmall.fontSize,
                          fontWeight: ThemeFont.bodySmall.fontWeight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
    String title,
    String description,
    String assetImage,
    Color cardColor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 88,
                width: 88,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  assetImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ThemeFont.bodyNormal,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Pallete.dark3,
                      fontSize: ThemeFont.bodySmall.fontSize,
                      fontWeight: ThemeFont.bodySmall.fontWeight,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, bottom: 48, right: 16),
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallete.mainDarker,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
