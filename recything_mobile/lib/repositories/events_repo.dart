import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/models/events_model.dart';
import 'package:recything_mobile/services/base_service.dart';

class EventRepo extends BaseService {
  Future<List<EventsModel>> getAllEvent(
      {BuildContext? context, required String id}) async {
    final res = await request(context, '/users/event/$id');
    Logger().i(res);
    return res.data['message'] == 'data belum tersedia'
        ? List<EventsModel>.empty()
        : List<EventsModel>.from(
            (res.data["data"] as Iterable).map((e) => EventsModel.fromJson(e)));
  }
}
