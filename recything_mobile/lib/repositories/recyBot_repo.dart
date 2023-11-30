import 'package:dio/dio.dart';

import '../services/shared_pref_service.dart';

class RecyBotRepo {
  Dio dio = Dio();

  Future<String> postQuestion(String value) async {
    final String? authToken = await SharedPreferenceService.getToken();

    if (authToken == null) {
      throw Exception('Authorization token not available.');
    }

    dio.options.headers['Authorization'] =
        'Bearer $authToken';
    final response = await dio.post(
      'https://recybot---recything-api-niyyqhuhua-uc.a.run.app/recybot',
      data: {'question': value},
    );
    return response.data['data'];
  }
}
