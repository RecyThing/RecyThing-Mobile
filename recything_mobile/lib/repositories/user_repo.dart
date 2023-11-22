import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recything_mobile/models/user_model.dart';
import 'package:recything_mobile/services/base_service.dart';

class UserRepo extends BaseService {
  Future<UserModel> getUserProfile(BuildContext context) async {
    final res = await request(context, 'users/profile');
    Logger().e(res);
    return UserModel.fromJson(res.data["data"]);
  }
}
