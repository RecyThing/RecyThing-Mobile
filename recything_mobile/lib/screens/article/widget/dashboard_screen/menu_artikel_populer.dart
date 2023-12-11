import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_popular_article/get_popular_article_cubit.dart';
import 'package:recything_mobile/screens/article/theme/text_style.dart';
import 'package:recything_mobile/screens/article/widget/dashboard_screen/list_artikel_populer.dart';
import '../../../../constants/pallete.dart';

class MenuArticlePopular extends StatelessWidget {
  const MenuArticlePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Artikel Populer",
                style: ThemeText().heading6Medium,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cariArtikel');
                  },
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
              } else {
                return ListArtikelPopuplerWidget(
                  physicsScroll: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
