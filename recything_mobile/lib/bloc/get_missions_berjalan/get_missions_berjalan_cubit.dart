import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recything_mobile/models/get_missions_model.dart';
import 'package:recything_mobile/repositories/get_missions_repo.dart';

part 'get_missions_berjalan_state.dart';

class GetMissionsBerjalanCubit extends Cubit<GetMissionsBerjalanState> {
  GetMissionsBerjalanCubit() : super(GetMissionsBerjalanInitial());
  final _getMissionsBerjalanRepo = GetMissionsRepo();
  GetMissionsModel? missionsData;

  Future<void> resetState() async {
    await Future.delayed(Duration(seconds: 0));
    emit(GetMissionsBerjalanInitial());
  }

  Future<void> getMissionsBerjalan() async {
    if (state is GetMissionsBerjalanLoaded) return;

    emit(GetMissionsBerjalanLoading());

    try {
      missionsData =
          await _getMissionsBerjalanRepo.getMissions(filter: 'berjalan');

      emit(GetMissionsBerjalanLoaded(
          missionsBerjalan: missionsData ??
              GetMissionsModel(status: false, message: 'message', data: [])));
    } catch (e) {
      emit(GetMissionsBerjalanFailed());
    }
  }
}
