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

  Future<List<ArticleModel>> getArticleByCategory(String filter) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response = await dio.get('$baseUrl/articles?filter=$filter');
    return List<ArticleModel>.from((response.data['data'] as Iterable)
        .map((e) => ArticleModel.fromJson(e)));
  }

  Future<List<ArticleModel>> getArticleById(String id) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response = await dio.get('$baseUrl/articles/$id');
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

  Future<List<ArticleModel>> searchArticleByCategory(
      String filter, String data) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response =
        await dio.get('$baseUrl/articles?filter=$filter&data=$data');
    return List<ArticleModel>.from((response.data['data'] as Iterable)
        .map((e) => ArticleModel.fromJson(e)));
  }

  Future<List<ArticleModel>> getPopularArticle() async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response = await dio.get('$baseUrl/articles/popular');
    return List<ArticleModel>.from((response.data['data'] as Iterable)
        .map((e) => ArticleModel.fromJson(e)));
  }

  Future<String> postLikeArticle(String id) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] = 'Bearer $authToken';
    final response = await dio.post('$baseUrl/articles/like/$id');
    return response.data['message'];
  }
}
