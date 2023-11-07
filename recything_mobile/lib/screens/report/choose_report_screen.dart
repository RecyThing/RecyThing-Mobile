import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class ChooseReport extends StatefulWidget {
  const ChooseReport({super.key});

  @override
  State<ChooseReport> createState() => _ChooseReportState();
}

class _ChooseReportState extends State<ChooseReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Pelaporan',
          style: ThemeFont.heading6,
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 24,
                right: 185,
              ),
              child: Text(
                'Pilih Jenis Pelaporan',
                style: ThemeFont.heading6,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, bottom: 16, right: 12),
                  child: Container(
                    height: 88,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0XFFE2FEE1), //warna background gambar
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/images/tumpukan_sampah.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.5, bottom: 18.5, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tumpukan Sampah',
                        style: ThemeFont.bodyNormal,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Lapor penumpukan sampah sembarangan.',
                        style: TextStyle(
                            color: Pallete.dark3,
                            fontSize: ThemeFont.bodySmall.fontSize,
                            fontWeight: ThemeFont.bodySmall.fontWeight),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Pallete.mainDarker),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ), SizedBox(height: 16,),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
