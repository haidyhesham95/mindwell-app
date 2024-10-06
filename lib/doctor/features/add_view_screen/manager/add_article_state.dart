part of 'add_article_cubit.dart';

@immutable
abstract class AddArticleState {}

class AddArticleInitial extends AddArticleState {}
class GetData extends AddArticleState {}
class Loading extends AddArticleState {}
class GetArticles extends AddArticleState {}
class AddImage extends AddArticleState {}
class ImageLoading extends AddArticleState {}
class Success extends AddArticleState {}
class FormCleared extends AddArticleState {}

class AddArticleError extends AddArticleState {
  final String error;
  AddArticleError(this.error);
}
class ImageError extends AddArticleState {
  final String error;
  ImageError(this.error);
}
class AddArticleImageErrorState extends AddArticleState {}


