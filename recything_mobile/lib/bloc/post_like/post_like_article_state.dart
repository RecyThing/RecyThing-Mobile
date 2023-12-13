part of 'post_like_article_cubit.dart';

@immutable
sealed class PostLikeArticleState extends Equatable{
  const PostLikeArticleState();

  @override
  List<Object> get props => [];
}

final class PostLikeArticleInitial extends PostLikeArticleState {}

final class PostLikeLoading extends PostLikeArticleState {}

final class PostLikeSuccess extends PostLikeArticleState {
  final String message;

  const PostLikeSuccess({required this.message});
}

final class PostLikeFailure extends PostLikeArticleState {
  final String message;

  const PostLikeFailure({required this.message});
}
