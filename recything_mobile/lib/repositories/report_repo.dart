import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/models/report_model.dart';
import 'package:recything_mobile/services/base_service.dart';

class ReportRepo extends BaseService {
  Future<List<ReportModel>> getUserProfile(BuildContext context) async {
    final res = await request(context, 'reports/history');
    Logger().e(res);
    return List<ReportModel>.from(
      (res.data['data'] as Iterable).map((e) => ReportModel.fromJson(e)),
    );
  }
}
