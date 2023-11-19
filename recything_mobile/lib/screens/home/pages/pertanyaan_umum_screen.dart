import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/widgets/pertanyaan_card.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class PertanyaanUmumScren extends StatefulWidget {
  const PertanyaanUmumScren({super.key});

  @override
  State<PertanyaanUmumScren> createState() => _PertanyaanUmumScrenState();
}

class _PertanyaanUmumScrenState extends State<PertanyaanUmumScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Pallete.textMainButton,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: Text(
          "Pertanyaan Umum",
          style: ThemeFont.heading6Medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const MainTextField(
                prefixIcon: IconlyLight.search, label: "Cari Pertanyaan..."),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) => const PertanyaanCard())),
            )
          ],
        ),
      ),
    );
  }
}
