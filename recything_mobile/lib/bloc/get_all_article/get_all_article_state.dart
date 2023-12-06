part of 'get_all_article_cubit.dart';

@immutable
sealed class GetAllArticleState extends Equatable {
  const GetAllArticleState();

  @override
  List<Object> get props => [];
}

final class GetAllArticleInitial extends GetAllArticleState {}

final class GetAllArticleLoading extends GetAllArticleState {}

final class GetAllArticleSuccess extends GetAllArticleState {
  final List<ArticleModel> data;

  const GetAllArticleSuccess({required this.data});
}

final class GetAllArticleFailure extends GetAllArticleState {
  final String message;

  const GetAllArticleFailure({required this.message});
}
