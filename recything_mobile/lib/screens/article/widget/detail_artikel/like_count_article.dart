import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/get_popular_article/get_popular_article_cubit.dart';
import '../../../../constants/pallete.dart';

class LikeCountArticleWidget extends StatelessWidget {
  final int index;
  const LikeCountArticleWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    String like = "";
    return BlocListener<GetPopularArticleCubit, GetPopularArticleState>(
      listener: (context, state) {
        if (state is GetPopularArticleSuccess) {
          like = state.data[index].like.toString();
        }
      },
      child: Builder(
        builder: (context) {
          return Text(
            like,
            style: ThemeFont.bodySmallRegular.copyWith(color: Pallete.dark3),
          );
        },
      ),
    );
  }
}
