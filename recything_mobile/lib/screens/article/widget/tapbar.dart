import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/screens/article/widget/cari_artikel/artikel_tidak_ditemukan.dart';
import 'package:recything_mobile/screens/article/widget/list_artikel.dart';

import '../../../bloc/get_article/get_article_cubit.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.73,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Populer'),
                Tab(text: 'Terbaru'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ArtikelTidakDitemukanWidget(),
                  BlocBuilder<GetArticleCubit, GetArticleState>(
                    builder: (context, state) {
                      if (state is GetArticleInitial) {
                        context.read<GetArticleCubit>().getAllArticle(1);
                      } else if (state is GetArticleLoading) {
                        return SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator());
                      } else if (state is GetArticleSuccess) {
                        return ListArtikelWidget();
                      } else if (state is GetArticleFailure) {
                        // return Text(state.message);
                        return ArtikelTidakDitemukanWidget();
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
