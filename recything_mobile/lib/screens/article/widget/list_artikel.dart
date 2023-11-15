import 'package:flutter/material.dart';

import '../theme/text_style.dart';

class ListArtikelWidget extends StatelessWidget {
  const ListArtikelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(12)),
                                height: 86,
                                width: 86,
                                child: Image.asset(
                                  'assets/images/minyak.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                height: 96,
                                width: 226,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: double.infinity,
                                      child: Text(
                                        'Minyak',
                                        style: ThemeText().bodySmallRegular2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 48,
                                      child: SizedBox(
                                        height: 24,
                                        child: Text(
                                          'Pakai sisa minyak gorengmu untuk ini!',
                                          style: ThemeText().bodyNormalMedium,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24,
                                      child: Row(
                                        children: [
                                          Text('22 Okt 2023',
                                              style: ThemeText()
                                                  .bodySmallRegular3),
                                          const SizedBox(width: 7),
                                          Image.asset(
                                              'assets/icons/icon_vertical_divider.png'),
                                          const SizedBox(width: 7),
                                          Image.asset(
                                              'assets/icons/icon_like.png'),
                                          const SizedBox(width: 4),
                                          const Text('182'),
                                          const SizedBox(width: 4),
                                          Image.asset(
                                              'assets/icons/icon_share.png'),
                                          const SizedBox(width: 8),
                                          const Text('182'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  }),
            );
  }
}