
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/post_like/post_like_article_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/widget/detail_artikel/detail_article_content.dart';
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
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String id = args['id'] ?? "";
    String category = args['category'] ?? "";
    bool isByCategory = args['isByCategory'] ?? "";

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 42, left: 16, right: 16),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/icons/icon_back_button.png'),
                    ),
                    onTap: () {
                      if (isByCategory == true) {
                        context
                            .read<GetArticleCubit>()
                            .getArticleByCategory(category);
                      } else {
                        context.read<GetArticleCubit>().getAllArticle(1);
                        context
                            .read<GetPopularArticleCubit>()
                            .getPopularArticle();
                      }
                      // context.read<GetArticleCubit>().clearDdetailArtikel();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 21,
                    child: Text(
                      "Detail Artikel",
                      style: ThemeFont.heading6Medium
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          BlocListener<GetArticleCubit, GetArticleState>(
            listener: (context, state) {},
            child: Builder(
              builder: (context) {
                var item = context.watch<GetArticleCubit>().DetailArtikel;
                return DetailArticleContentWidget(
                    image: item['image'] ?? "",
                    title: item['title'] ?? "",
                    category: item['category'] ?? "",
                    like: item['like'] ?? "",
                    updateDate: item['createdDate'] ?? "",
                    content: item['content'] ?? "");
              },
            ),
          )
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
                        return BlocBuilder<GetArticleCubit, GetArticleState>(
                          builder: (context, state) {
                            if (state is GetArticleByIdSuccess) {
                              return BottomsheetDetailArtikel(
                                image: state.data.image,
                                title: state.data.title,
                                category: state.data.getCategoryString(),
                                updateDate: state.data.createdDate,
                              );
                            }
                            return SizedBox();
                          },
                        );
                      });
                },
              ),
            ),
            const SizedBox(width: 15),
            BlocBuilder<PostLikeArticleCubit, PostLikeArticleState>(
              builder: (context, state) {
                return GestureDetector(
                  child: Container(
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
                  ),
                  onTap: () {
                    print(id);
                    context.read<PostLikeArticleCubit>().postLikeArticle(id);
                    if (state is PostLikeSuccess) {
                      print(state.message);
                      context.read<GetArticleCubit>().getArticleById(id);
                    } else if (state is PostLikeFailure) {
                      print(state.message);
                      context.read<GetArticleCubit>().getArticleById(id);
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
