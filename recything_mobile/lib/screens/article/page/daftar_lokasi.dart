import 'package:flutter/material.dart';
import 'package:recything_mobile/screens/article/widget/daftar_lokasi/list_lokasi.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';

class DaftarLokasiScreen extends StatefulWidget {
  const DaftarLokasiScreen({super.key});

  @override
  State<DaftarLokasiScreen> createState() => _DaftarLokasiScreenState();
}

class _DaftarLokasiScreenState extends State<DaftarLokasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  HeaderPageWidget(title: 'Daftar Lokasi'),
                  SizedBox(height: 24),
                  SearchBarWidget(
                    onChanged: (String) {},
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(),
            // SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListLokasiWidget(),
            )
          ],
        ),
      ),
    );
  }
}
