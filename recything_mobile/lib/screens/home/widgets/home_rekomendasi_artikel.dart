import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/list_artikel_populer.dart';
import '../../../bloc/get_popular_article/get_popular_article_cubit.dart';
import '../../article/theme/text_style.dart';

class HomeRekomendasiArtikel extends StatelessWidget {
  const HomeRekomendasiArtikel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rekomendasi Artikel",
              style: ThemeFont.interText
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Lihat Semua",
                  style: ThemeFont.interText.copyWith(
                      color: Pallete.main, fontWeight: FontWeight.w400),
                ))
          ],
        ),
        BlocBuilder<GetPopularArticleCubit, GetPopularArticleState>(
          builder: (context, state) {
            if (state is GetPopularArticleLoading) {
              return SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator());
            } else if (state is GetPopularArticleFailure) {
              return Text(state.message);
            }
            return ListArtikelPopuplerWidget(
                physicsScroll: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 3);
          },
        )
      ],
    );
  }
}
