import 'package:dio/dio.dart';
import 'package:recything_mobile/constants/constans.dart';
import 'package:recything_mobile/models/article_model.dart';

class ArticleRepo {
  Dio dio = Dio();

  Future<List<ArticleModel>> getAllArticle() async {
    final response = await dio.get('$baseUrl/articles');
    return List<ArticleModel>.from((response.data['data'] as Iterable)
        .map((e) => ArticleModel.fromJson(e)));
  }
}
