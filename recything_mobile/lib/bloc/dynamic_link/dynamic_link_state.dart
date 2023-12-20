part of 'dynamic_link_cubit.dart';

@immutable
sealed class DynamicLinkState extends Equatable {
  const DynamicLinkState();

  @override
  List<Object> get props => [];
}

final class DynamicLinkInitial extends DynamicLinkState {}

final class DynamicLinkSuccess extends DynamicLinkState {
  final String id_artikel;

  const DynamicLinkSuccess({required this.id_artikel});
}
