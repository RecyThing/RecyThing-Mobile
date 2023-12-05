import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recything_mobile/models/drop_points_repo.dart';
import 'package:recything_mobile/repositories/drop_points_repo.dart';

part 'get_all_drop_point_state.dart';

class GetAllDropPointCubit extends Cubit<GetAllDropPointState> {
  GetAllDropPointCubit() : super(GetAllDropPointInitial());
  final _repo = DropPointsRepo();

  void fetchData(
      {BuildContext? context, int? limit, int? page, String? search}) async {
    emit(GetAllDropPointLoading());
    try {
      final data = await _repo.getDropPoints(
          context: context, limit: limit, page: page, search: search);
      emit(GetAllDropPointSuccess(data: data));
    } catch (e) {
      emit(GetAllDropPointFailure(msg: e.toString()));
    }
  }
}
