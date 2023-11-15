import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/widget/custom_card.dart';
import 'package:recything_mobile/screens/report/widget/detail_report_card.dart';

class DetailRiwayatPelaporanScreen extends StatefulWidget {
  const DetailRiwayatPelaporanScreen({super.key});

  @override
  State<DetailRiwayatPelaporanScreen> createState() =>
      _DetailRiwayatPelaporanScreenState();
}

class _DetailRiwayatPelaporanScreenState
    extends State<DetailRiwayatPelaporanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail pelaporan'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              // color: Colors.blue,
              padding: const EdgeInsetsDirectional.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, -2),
                          blurRadius: 13,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Jenis Pelaporan: ',
                            style: TextStyle(
                              fontSize: ThemeFont.bodyNormal.fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Tumpukan Sampah',
                                style: TextStyle(
                                  fontSize: ThemeFont.bodyNormal.fontSize,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: 'Status Pelaporan: ',
                            style: TextStyle(
                              fontSize: ThemeFont.bodyNormal.fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'DITOLAK',
                                style: TextStyle(
                                  fontSize: ThemeFont.bodyNormal.fontSize,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: 'Alasan: ',
                            style: TextStyle(
                              fontSize: ThemeFont.bodyNormal.fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Detail Kejadian Kurang Jelas',
                                style: TextStyle(
                                  fontSize: ThemeFont.bodyNormal.fontSize,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  const DetailReportCard(
                    title: 'Lokasi Sampah',
                    subTitle:
                        'Jln DI Pandjaitan No 22 Jakarta. Sebelah Utara Pertigaan Jln DI Pandjaitan',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const DetailReportCard(
                    title: 'Lokasi Patokan',
                    subTitle: 'Sebelah Utara Pertigaan Jln DI Pandjaitan',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const DetailReportCard(
                    title: 'Informasi Jenis Sampah',
                    subItems: ['Sampah Kering', 'Sampah Basah'],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const DetailReportCard(
                    title: 'Detail Kondisi Sampah',
                    subTitle: 'ada sampah disana tadi bang',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const DetailReportCard(
                    title: 'Bukti Foto / Video',
                    //image:
                  ),
                ],
              )),
        ));
  }
}
