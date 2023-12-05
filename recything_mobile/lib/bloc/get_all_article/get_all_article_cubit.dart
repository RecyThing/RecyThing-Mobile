import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recything_mobile/models/article_model.dart';
import 'package:recything_mobile/repositories/article_repo.dart';
part 'get_all_article_state.dart';

class GetAllArticleCubit extends Cubit<GetAllArticleState> {
  GetAllArticleCubit() : super(GetAllArticleInitial());

  void getAllArticle() async {
    emit(GetAllArticleLoading());
    try {
      final response = await ArticleRepo().getAllArticle();
      emit(GetAllArticleSuccess(data: response));
    } catch (e) {
      emit(GetAllArticleFailure(message: e.toString()));
    }
  }
}
