import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recything_mobile/models/get_missions_model.dart';
import 'package:recything_mobile/repositories/get_missions_repo.dart';

part 'get_missions_state.dart';

class GetMissionsCubit extends Cubit<GetMissionsState> {
  GetMissionsCubit() : super(GetMissionsInitial());
  final _getMissionsRepo = GetMissionsRepo();
  GetMissionsModel? missionsData;

  Future<void> resetState() async {
    await Future.delayed(Duration(seconds: 0));
    emit(GetMissionsInitial());
  }

  Future<void> getMissions() async {
    if (state is GetMissionsLoaded) return;

    emit(GetMissionsLoading());

    try {
      missionsData = await _getMissionsRepo.getMissions();

      emit(GetMissionsLoaded(
          missions: missionsData ??
              GetMissionsModel(status: false, message: 'message', data: [])));
    } catch (e) {
      emit(GetMissionsFailed());
    }
  }
}
