part of 'get_missions_selesai_cubit.dart';

sealed class GetMissionsSelesaiState extends Equatable {
  const GetMissionsSelesaiState();

  @override
  List<Object> get props => [];
}

final class GetMissionsSelesaiInitial extends GetMissionsSelesaiState {}

final class GetMissionsSelesaiLoading extends GetMissionsSelesaiState {}

final class GetMissionsSelesaiLoaded extends GetMissionsSelesaiState {
  final GetMissionsModel missionsSelesai;

  const GetMissionsSelesaiLoaded({required this.missionsSelesai});

  @override
  List<Object> get props => [missionsSelesai];
}

final class GetMissionsSelesaiFailed extends GetMissionsSelesaiState {}
