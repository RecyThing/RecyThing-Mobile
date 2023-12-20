part of 'get_missions_berjalan_cubit.dart';

sealed class GetMissionsBerjalanState extends Equatable {
  const GetMissionsBerjalanState();

  @override
  List<Object> get props => [];
}

final class GetMissionsBerjalanInitial extends GetMissionsBerjalanState {}

final class GetMissionsBerjalanLoading extends GetMissionsBerjalanState {}

final class GetMissionsBerjalanLoaded extends GetMissionsBerjalanState {
  final GetMissionsModel missionsBerjalan;

  const GetMissionsBerjalanLoaded({required this.missionsBerjalan});

  @override
  List<Object> get props => [missionsBerjalan];
}

final class GetMissionsBerjalanFailed extends GetMissionsBerjalanState {}
