import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/screens/article/widget/cari_artikel/artikel_tidak_ditemukan.dart';
import 'package:recything_mobile/screens/article/widget/list_artikel.dart';
import '../../../bloc/get_article/get_article_cubit.dart';

class TapBarWidget extends StatefulWidget {
  const TapBarWidget({Key? key}) : super(key: key);

  @override
  State<TapBarWidget> createState() => _TapBarWidgetState();
}

class _TapBarWidgetState extends State<TapBarWidget> {
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
                        return Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator()),
                        );
                      } else if (state is GetArticleSuccess) {
                        return ListArtikelWidget();
                      } else if (state is GetArticleFailure) {
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
