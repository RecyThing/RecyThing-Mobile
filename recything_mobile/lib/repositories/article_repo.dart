import 'package:dio/dio.dart';
import 'package:recything_mobile/constants/constans.dart';
import 'package:recything_mobile/models/article_model.dart';

import '../services/shared_pref_service.dart';

class ArticleRepo {
  Dio dio = Dio();

  Future<List<ArticleModel>> getAllArticle(int page) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response = await dio.get('$baseUrl/articles?limit=10&page=$page');
    return List<ArticleModel>.from((response.data['data'] as Iterable)
        .map((e) => ArticleModel.fromJson(e)));
  }

  Future<List<ArticleModel>> searchArticle(String data) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response = await dio.get('$baseUrl/articles?search=$data&limit=10');
    return List<ArticleModel>.from((response.data['data'] as Iterable)
        .map((e) => ArticleModel.fromJson(e)));
  }
}
