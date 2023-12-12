part of 'upload_proof_cubit.dart';

sealed class UploadProofState extends Equatable {
  const UploadProofState();

  @override
  List<Object> get props => [];
}

final class UploadProofInitial extends UploadProofState {}

final class UploadProofLoading extends UploadProofState {}

final class UploadProofSuccess extends UploadProofState {
  final List<XFile> images;

  const UploadProofSuccess({required this.images});

  @override
  List<Object> get props => [images];
}

final class UploadProofToServerLoading extends UploadProofState {}

final class UploadProofToServerSuccess extends UploadProofState {}

final class UploadProofToServerFailed extends UploadProofState {
  final String errorMsg;

  const UploadProofToServerFailed({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
