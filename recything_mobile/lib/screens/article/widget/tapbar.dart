import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/screens/article/widget/cari_artikel/artikel_tidak_ditemukan.dart';
import 'package:recything_mobile/widgets/list_artikel_global.dart';
import '../../../bloc/get_article/get_article_cubit.dart';
import '../../../bloc/get_popular_article/get_popular_article_cubit.dart';

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
                  BlocBuilder<GetPopularArticleCubit, GetPopularArticleState>(
                    builder: (context, state) {
                      if (state is GetPopularArticleLoading) {
                        return Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator()),
                        );
                      } else if (state is GetPopularArticleSuccess) {
                        // context.read<ValueIsPopularCubit>().setPopularTab();
                        return ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: ListArticleGlobalWidget(
                                  image: state.data[index].image,
                                  title: state.data[index].title,
                                  category:
                                      state.data[index].getCategoryString(),
                                  like: state.data[index].like.toString(),
                                  updateDate: state.data[index].updateDate,
                                  id: state.data[index].id),
                              onTap: () {
                                bool isPopular = true;
                                Navigator.pushNamed(context, '/detailArtikel',
                                    arguments: {
                                      "isPopular": isPopular,
                                      "index": index,
                                      "id" : state.data[index].id
                                    });
                              },
                            );
                          },
                        );
                      } else if (state is GetPopularArticleFailure) {
                        return ArtikelTidakDitemukanWidget();
                      }
                      return SizedBox();
                    },
                  ),
                  BlocBuilder<GetArticleCubit, GetArticleState>(
                    builder: (context, state) {
                      if (state is GetArticleLoading) {
                        return Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator()),
                        );
                      } else if (state is GetArticleSuccess) {
                        // context.read<ValueIsPopularCubit>().setTerbaruTab();
                        return ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: ListArticleGlobalWidget(
                                  image: state.data[index].image,
                                  title: state.data[index].title,
                                  category:
                                      state.data[index].getCategoryString(),
                                  like: state.data[index].like.toString(),
                                  updateDate: state.data[index].updateDate,
                                  id: state.data[index].id),
                              onTap: () {
                                bool isPopular = false;
                                Navigator.pushNamed(context, '/detailArtikel',
                                    arguments: {
                                      "isPopular": isPopular,
                                      "index": index,
                                      "id" : state.data[index].id,
                                      "like" : state.data[index].like.toString()
                                    });
                              },
                            );
                          },
                        );
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
