part of 'articles_cubit.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}
class ArticlesLoading extends ArticlesState {}
class ArticlesGetData extends ArticlesState {}

