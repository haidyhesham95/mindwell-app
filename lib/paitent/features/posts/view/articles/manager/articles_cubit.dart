import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mindwell/shared_features/feed/model/articles_model.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitial());

  static ArticlesCubit get(context) => BlocProvider.of(context);
  List<ArticlesModel> articles = [];


  void getArticles() {
    emit(ArticlesLoading());
    FirebaseFirestore.instance.collection("Articles").get().then((value) {
      for (var element in value.docs) {
        articles.add(ArticlesModel.fromJson(element.data()));
        emit(ArticlesGetData());
      }
    });
  }
}
