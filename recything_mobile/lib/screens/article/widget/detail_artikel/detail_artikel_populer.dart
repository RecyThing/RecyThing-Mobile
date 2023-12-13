import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recything_mobile/bloc/get_popular_article/get_popular_article_cubit.dart';
import '../../../../constants/pallete.dart';

class DetailArtikelPopulerWidget extends StatelessWidget {
  final int index;
  const DetailArtikelPopulerWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    String like = "";
    return BlocBuilder<GetPopularArticleCubit, GetPopularArticleState>(
      builder: (context, state) {
        if (state is GetPopularArticleSuccess) {
          like = state.data[index].like.toString();
          return Column(
            children: [
              SizedBox(
                height: 240,
                width: double.infinity,
                child: Image.network(
                  state.data[index].image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.data[index].title,
                      style: ThemeFont.bodyLargeBold,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                state.data[index].getCategoryString(),
                                style: ThemeFont.bodySmallRegular
                                    .copyWith(color: Pallete.main),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                '|',
                                style: TextStyle(color: Pallete.dark4),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                state.data[index].updateDate,
                                style: ThemeFont.bodySmallRegular
                                    .copyWith(color: Pallete.dark3),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'assets/icons/icon_like_outline.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 5),
                              BlocListener<GetPopularArticleCubit,
                                  GetPopularArticleState>(
                                listener: (context, state) {
                                  if (state is GetPopularArticleSuccess) {
                                    like = state.data[index].like.toString();
                                  }
                                },
                                child: Builder(
                                  builder: (context) {
                                    return Text(
                                      like,
                                      style: ThemeFont.bodySmallRegular
                                          .copyWith(color: Pallete.dark3),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Html(
                      data: "<p>${state.data[index].content}</p>",
                      style: {
                        "p": Style(textAlign: TextAlign.justify),
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
