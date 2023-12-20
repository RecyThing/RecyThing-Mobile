import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recything_mobile/models/get_missions_model.dart';
import 'package:recything_mobile/repositories/get_missions_repo.dart';

part 'get_missions_selesai_state.dart';

class GetMissionsSelesaiCubit extends Cubit<GetMissionsSelesaiState> {
  GetMissionsSelesaiCubit() : super(GetMissionsSelesaiInitial());
  final _getMissionsSelesaiRepo = GetMissionsRepo();
  GetMissionsModel? missionsData;

  Future<void> resetState() async {
    await Future.delayed(Duration(seconds: 0));
    emit(GetMissionsSelesaiInitial());
  }

  Future<void> getMissionsSelesai() async {
    if (state is GetMissionsSelesaiLoaded) return;

    emit(GetMissionsSelesaiLoading());

    try {
      missionsData =
          await _getMissionsSelesaiRepo.getMissions(filter: 'selesai');

      emit(GetMissionsSelesaiLoaded(
          missionsSelesai: missionsData ??
              GetMissionsModel(status: false, message: 'message', data: [])));
    } catch (e) {
      emit(GetMissionsSelesaiFailed());
    }
  }
}
