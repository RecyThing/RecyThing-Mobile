import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/constants/api.dart';
import 'package:recything_mobile/models/get_missions_model.dart';
import 'package:recything_mobile/services/shared_pref_service.dart';

class GetMissionsRepo {
  Dio dio = Dio(BaseOptions(baseUrl: Api.baseUrl));

  Future<GetMissionsModel> getMissions() async {
    final token = await SharedPreferenceService.getToken();

    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final res = await dio.get("missions", options: options);

      Logger().i(res.data);
      return GetMissionsModel.fromJson(res.data);
    } on DioException catch (e) {
      Logger().e(e.response);
      throw Exception(e);
    }
  }
}
