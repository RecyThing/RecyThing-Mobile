part of 'get_article_cubit.dart';

@immutable
sealed class GetArticleState extends Equatable {
  const GetArticleState();

  @override
  List<Object> get props => [];
}

final class GetArticleInitial extends GetArticleState {}

final class GetArticleLoading extends GetArticleState {}

final class GetArticleSuccess extends GetArticleState {
  final List<ArticleModel> data;

  const GetArticleSuccess({required this.data});
}

final class GetArticleFailure extends GetArticleState {
  final String message;

  const GetArticleFailure({required this.message});
}