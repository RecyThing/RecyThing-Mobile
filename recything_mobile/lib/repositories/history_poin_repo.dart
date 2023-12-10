import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/models/history_poin_model.dart';
import 'package:recything_mobile/services/base_service.dart';

class HistoryPoinRepo extends BaseService {
  Future<List<HistoryPoinModel>> getHistoryPoin(BuildContext context) async {
    final res = await request(context, '/users/point/history');
    Logger().i(res);
    return List<HistoryPoinModel>.from((res.data["data"] as Iterable)
        .map((e) => HistoryPoinModel.fromJson(e)));
  }
}
