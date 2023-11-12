import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/missions/widgets/progress_step.dart';

class DetailMission extends StatelessWidget {
  const DetailMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Pallete.light3)),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 24,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Text(
              'Detail Misi',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              width: 24,
            )
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Image.network(
                fit: BoxFit.cover,
                'https://th-thumbnailer.cdn-si-edu.com/VfbEt333BHHvojYjzpms7_qeTU0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/f6/30/f6300fcc-c929-4e30-adaa-fc3b62a495a5/42-18260830edit.jpg'),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buang Sampah',
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berlaku Sampai',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '02 Desember 2023',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Pallete.dark3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hadiah',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '100 poin',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Pallete.secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Deskripsi',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Buanglah sampah yang berserakan pada\ntempatnya',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 24,
                ),
                const ProgressStep()
              ],
            ),
          )
        ],
      ),
    );
  }
}
