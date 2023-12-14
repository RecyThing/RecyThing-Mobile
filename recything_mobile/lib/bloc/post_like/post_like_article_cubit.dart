
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repositories/article_repo.dart';

part 'post_like_article_state.dart';

class PostLikeArticleCubit extends Cubit<PostLikeArticleState> {
  PostLikeArticleCubit() : super(PostLikeArticleInitial());

  void postLikeArticle(String id) async {
    emit(PostLikeLoading());
    try {
      final response = await ArticleRepo().postLikeArticle(id);
      if (response == "berhasil melakukan like") {
        emit(PostLikeSuccess(message: response));
      }
    } catch (e) {
      emit(PostLikeFailure(message: e.toString()));
    }
  }
}
