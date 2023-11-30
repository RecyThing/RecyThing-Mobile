import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/constants/api.dart';
import 'package:recything_mobile/models/report_model.dart';
import 'package:recything_mobile/services/base_service.dart';

class ReportRepo extends BaseService {
  Future<List<ReportModel>> getReportHistory(BuildContext context) async {
    final res = await request(context, 'reports/history');
    Logger().e(res);
    return List<ReportModel>.from(
      (res.data['data'] as Iterable).map((e) => ReportModel.fromJson(e)),
    );
  }

  Future<ReportModel> getReportHistoryById(param0,
      {BuildContext? context, required String id}) async {
    final res = await request(context, 'reports/history/$id');
    Logger().e(res);
    return ReportModel.fromJson(res.data["data"]);
  }

  Dio dio = Dio(BaseOptions(baseUrl: Api.baseUrl));

  Future<void> reports({
    required String reportType,
    required String location,
    required num longitude,
    required num latitude,
    required String addressPoint,
    required String trashType,
    required String desc,
    required List<ImageModel> images,
  }) async {
    try {
      final data = {
        "report_type": reportType,
        "location": location,
        "longitude": longitude,
        "latitude": latitude,
        "address_point": addressPoint,
        "trash_type": trashType,
        "description": desc,
        "images": images.map((image) => image.toJson()).toList(),
      };
      Logger().i(data);

      final response = await dio.post("reports", data: data);

      Map<String, dynamic> responseData = json.decode(response.toString());
      Logger().i(responseData);
    } on DioException catch (e) {
      Logger().e(e.response);
      if (e.response != null) {
        final response = jsonDecode(e.response.toString());
        throw response["message"];
      }
    }
  }
}
