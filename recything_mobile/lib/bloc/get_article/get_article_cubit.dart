import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recything_mobile/models/article_model.dart';
import 'package:recything_mobile/repositories/article_repo.dart';
part 'get_article_state.dart';

class GetArticleCubit extends Cubit<GetArticleState> {
  Map<String, dynamic> DetailArtikel = {};

  GetArticleCubit() : super(GetArticleInitial());

  void clearDdetailArtikel() {
    DetailArtikel.clear();
  }

  void getAllArticle(int page) async {
    emit(GetArticleLoading());
    try {
      final response = await ArticleRepo().getAllArticle(page);
      emit(GetArticleSuccess(data: response));
    } catch (e) {
      emit(GetArticleFailure(message: e.toString()));
    }
  }

  void searchArticle(String data) async {
    emit(GetArticleLoading());
    try {
      final response = await ArticleRepo().searchArticle(data);
      if (response.isEmpty) {
        emit(GetArticleFailure(message: "data not found"));
      } else {
        emit(GetArticleSuccess(data: response));
      }
    } catch (e) {
      emit(GetArticleFailure(message: e.toString()));
    }
  }

  void searchArticleByCategory(String filter, String data) async {
    emit(GetArticleLoading());
    try {
      final response =
          await ArticleRepo().searchArticleByCategory(filter, data);
      if (response.isEmpty) {
        emit(GetArticleFailure(message: "data not found"));
      } else {
        emit(GetArticleSuccess(data: response));
      }
    } catch (e) {
      emit(GetArticleFailure(message: e.toString()));
    }
  }

  void getArticleByCategory(String filter) async {
    emit(GetArticleLoading());
    try {
      final response = await ArticleRepo().getArticleByCategory(filter);
      if (response.isEmpty) {
        emit(GetArticleFailure(message: "data not found"));
      } else {
        emit(GetArticleSuccess(data: response));
      }
    } catch (e) {
      emit(GetArticleFailure(message: e.toString()));
    }
  }

  void getArticleById(String id) async {
    emit(GetArticleLoading());
    try {
      final response = await ArticleRepo().getArticleById(id);
      final image = response.image;
      final title = response.title;
      final category = response.getCategoryString();
      final createdDate = response.createdDate;
      final like = response.like.toString();
      final content = response.content;

      // DetailArtikel.clear();
      DetailArtikel = {
        "image": image,
        "title": title,
        "category": category,
        "createdDate": createdDate,
        "like": like,
        "content": content
      };
      emit(GetArticleByIdSuccess(data: response));
    } catch (e) {
      emit(GetArticleFailure(message: e.toString()));
    }
  }

  void postLikeArticle(String id) async {
    emit(GetArticleLoading());
    try {
      final response = await ArticleRepo().postLikeArticle(id);
      emit(PostLikeArticleSuccess(message: response));
    } catch (e) {
      emit(GetArticleFailure(message: e.toString()));
    }
  }
}
