import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/detail_lokasi/bottom_detail_lokasi.dart';
import 'package:recything_mobile/screens/article/widget/detail_lokasi/container_map.dart';
import 'package:recything_mobile/screens/article/widget/detail_lokasi/data_detail_lokasi.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';

class DetailLokasiScreen extends StatefulWidget {
  const DetailLokasiScreen({super.key});

  @override
  State<DetailLokasiScreen> createState() => _DetailLokasiScreenState();
}

class _DetailLokasiScreenState extends State<DetailLokasiScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 66),
              child: HeaderPageWidget(title: 'Detail Lokasi'),
            ),
            SizedBox(height: 24),
            BoxMapWidget(),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: DataDetailLokasiWidget(),
            ),
          ],
        ),
        bottomNavigationBar: BottomDetailLokasiWidget());
  }
}
