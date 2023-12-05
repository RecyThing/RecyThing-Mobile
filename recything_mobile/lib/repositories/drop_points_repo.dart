import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/models/drop_points_repo.dart';
import 'package:recything_mobile/services/base_service.dart';

class DropPointsRepo extends BaseService {
  Future<List<DropPointsModel>> getDropPoints(
      {BuildContext? context,
      int? limit = 10,
      int? page = 1,
      String? search}) async {
    final params = {'search': search, 'limit': limit, 'page': page};
    final res = await request(context, 'drop-points', params: params);
    Logger().i(res);
    return List<DropPointsModel>.from(
        (res.data['data'] as Iterable).map((e) => DropPointsModel.fromJson(e)));
  }
}
