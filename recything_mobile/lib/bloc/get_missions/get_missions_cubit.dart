import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recything_mobile/models/get_missions_model.dart';
import 'package:recything_mobile/repositories/get_missions_repo.dart';

part 'get_missions_state.dart';

class GetMissionsCubit extends Cubit<GetMissionsState> {
  GetMissionsCubit() : super(GetMissionsInitial());
  final _getMissionsRepo = GetMissionsRepo();

  void getMissions() async {
    emit(GetMissionsLoading());

    try {
      final missionsData = await _getMissionsRepo.getMissions();
      emit(GetMissionsLoaded(missions: missionsData));
    } catch (e) {
      emit(GetMissionsFailed());
    }
  }
}
