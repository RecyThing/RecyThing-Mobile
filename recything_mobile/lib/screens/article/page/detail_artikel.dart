import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/widget/detail_artikel/detail_article_content.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import '../../../bloc/get_article/get_article_cubit.dart';
import '../../../bloc/get_popular_article/get_popular_article_cubit.dart';
import '../widget/detail_artikel/bottomsheet_detail_artikel.dart';

class DetailArtikelScreen extends StatefulWidget {
  const DetailArtikelScreen({super.key});

  @override
  State<DetailArtikelScreen> createState() => _DetailArtikelScreenState();
}

class _DetailArtikelScreenState extends State<DetailArtikelScreen> {
  @override
  Widget build(BuildContext context) {
    // final int index = ModalRoute.of(context)!.settings.arguments as int;
    // bool cek = true;

    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int index = args['index'];
    bool isPopular = args['isPopular'];

    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 42, left: 16, right: 16),
            child: HeaderPageWidget(title: 'Detail Artikel'),
          ),
          const SizedBox(height: 24),
          Builder(
            builder: (context) {
              if (isPopular == true) {
                return BlocBuilder<GetPopularArticleCubit,
                    GetPopularArticleState>(
                  builder: (context, state) {
                    // context.read<GetArticleCubit>().getArticleById(id);
                    if (state is GetPopularArticleSuccess) {
                      return DetailArticleContentWidget(
                          image: state.data[index].image,
                          title: state.data[index].title,
                          category: state.data[index].getCategoryString(),
                          like: state.data[index].like.toString(),
                          updateDate: state.data[index].updateDate,
                          content: state.data[index].content);
                    } else if (state is GetPopularArticleFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return SizedBox();
                  },
                );
              } else if (isPopular == false) {
                return BlocBuilder<GetArticleCubit, GetArticleState>(
                  builder: (context, state) {
                    // context.read<GetArticleCubit>().getArticleById(id);
                    if (state is GetArticleSuccess) {
                      return DetailArticleContentWidget(
                          image: state.data[index].image,
                          title: state.data[index].title,
                          category: state.data[index].getCategoryString(),
                          like: state.data[index].like.toString(),
                          updateDate: state.data[index].updateDate,
                          content: state.data[index].content);
                    } else if (state is GetArticleFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return SizedBox();
                  },
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 88,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Pallete.main,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'Share',
                    style: ThemeFont.heading6Bold.copyWith(color: Colors.white),
                  )),
                ),
                onTap: () {
                  showModalBottomSheet<void>(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        if (isPopular == true) {
                          return BlocBuilder<GetPopularArticleCubit,
                              GetPopularArticleState>(
                            builder: (context, state) {
                              if (state is GetPopularArticleSuccess) {
                                return BottomsheetDetailArtikel(
                                    image: state.data[index].image,
                                    title: state.data[index].title,
                                    category:
                                        state.data[index].getCategoryString(),
                                    updateDate: state.data[index].updateDate);
                              }
                              return SizedBox();
                            },
                          );
                        } else if (isPopular == false) {
                          return BlocBuilder<GetArticleCubit, GetArticleState>(
                            builder: (context, state) {
                              if (state is GetArticleSuccess) {
                                return BottomsheetDetailArtikel(
                                    image: state.data[index].image,
                                    title: state.data[index].title,
                                    category:
                                        state.data[index].getCategoryString(),
                                    updateDate: state.data[index].updateDate);
                              }
                              return SizedBox();
                            },
                          );
                        }
                        return SizedBox();
                      });
                },
              ),
            ),
            const SizedBox(width: 15),
            Container(
              height: 56,
              width: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.main),
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    'assets/icons/icon_green_like_outline.png',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
