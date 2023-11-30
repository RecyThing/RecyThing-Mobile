import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  // Future<void> addReport({
  //   required String reportType,
  //   required String location,
  //   required num longitude,
  //   required num latitude,
  //   required String addressPoint,
  //   required String trashType,
  //   required String desc,
  //   required List<XFile> images,
  // }) async {
  //   try {
  //     List<MultipartFile> imageFiles = [];

  //     for (var image in images) {
  //       List<int> imageBytes = await image.readAsBytes();
  //       String imageName = DateTime.now().toString();
  //       MultipartFile file = MultipartFile.fromBytes(
  //         imageBytes,
  //         filename: imageName,
  //       );
  //       imageFiles.add(file);
  //     }
  //     final data = {
  //       "report_type": reportType,
  //       "location": location,
  //       "longitude": longitude,
  //       "latitude": latitude,
  //       "address_point": addressPoint,
  //       "trash_type": trashType,
  //       "description": desc,
  //       "images": imageFiles,
  //     };

  //     FormData formData = FormData.fromMap(data);
  //     Logger().i(data);

  //     final response = await dio.post(
  //       "/reports",
  //       data: data,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'multipart/form-data',
  //         },
  //       ),
  //     );

  //     Map<String, dynamic> responseData = json.decode(response.toString());
  //     Logger().i(responseData);
  //   } on DioException catch (e) {
  //     Logger().e(e.response);
  //     if (e.response != null) {
  //       final response = jsonDecode(e.response.toString());
  //       throw response["message"];
  //     } else {
  //       throw "An unexpected error occured";
  //     }
  //   }
  // }
  Future<String> addReport({
    required BuildContext context,
    required String reportType,
    required String location,
    required num longitude,
    required num latitude,
    required String addressPoint,
    required String trashType,
    required String desc,
    required List<XFile> images,
  }) async {
    List<MultipartFile> imageFiles = [];

    for (var image in images) {
      List<int> imageBytes = await image.readAsBytes();
      String imageName = DateTime.now().toString();
      MultipartFile file = MultipartFile.fromBytes(
        imageBytes,
        filename: imageName,
      );
      imageFiles.add(file);
    }
    final data = {
      "report_type": reportType,
      "location": location,
      "longitude": longitude,
      "latitude": latitude,
      "address_point": addressPoint,
      "trash_type": trashType,
      "description": desc,
      "images": imageFiles,
    };

    FormData formData = FormData.fromMap(data);

    final response = await request(context, 'reports',
        requestType: RequestType.post, data: formData);

    Logger().i(response);

    return "berhasil";
  }
}
