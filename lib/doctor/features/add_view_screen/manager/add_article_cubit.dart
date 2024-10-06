import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../../paitent/features/profile/manager/lang/app_settings_cubit.dart';
import '../../../../shared_features/feed/model/articles_model.dart';
import '../../../../shared_utils/network/remote/api/http_helper.dart';

part 'add_article_state.dart';

class AddArticleCubit extends Cubit<AddArticleState> {
  AddArticleCubit() : super(AddArticleInitial());


  static AddArticleCubit get(context) => BlocProvider.of(context);
  TextEditingController addNameController = TextEditingController();
  TextEditingController addDescriptionController = TextEditingController();
  String? url;
  late File file;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loadImage = false;

  void clearForm() {
    url = null;
    addNameController.clear();
    addDescriptionController.clear();
    emit(FormCleared());

  }
  List<ArticlesModel> articles = [];
  List<String> articleId = [];


  void addArticle({required ArticlesModel articlesModel, required String id}) {
    FirebaseFirestore.instance
        .collection("doctors")
        .doc(id)
        .collection("articles")
        .doc()
        .set(articlesModel.toMap(id: id)).then((_) {
      clearForm();
    }).catchError((error) {
      emit(AddArticleError(error.toString()));
    });
  }

  void getArticle(context) {
    Map<String, dynamic> articleMap;
    emit(Loading());
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      for (var element in value.docs) {
        element.reference.collection('articles').get().then((value) {
          for (var element in value.docs) {
            articleId.add(element.id);
            element.reference.get().then((value) async {
              if (AppSettingsCubit.get(context).appLocale == const Locale('en')) {
                articleMap = element.data();
              } else {
                articleMap = {
                  'id': await Translate.translate(element.data()['id']),
                  'name': await Translate.translate(element.data()['name']),
                  'description': await Translate.translate(element.data()['description']),
                  'image': element.data()['image'],
                };
              }
              articles.add(ArticlesModel.fromJson(articleMap));
              emit(GetArticles());
            });
          }
        });
      }
    });
  }







  Future<void> addImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      loadImage = true;
      emit(ImageLoading());

      try {
        file = File(image.path);
        var imageName = basename(image.path);
        var refStorage = FirebaseStorage.instance.ref().child('ArticleImages/$imageName');

        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        emit(AddImage());
      } catch (e) {
        emit(ImageError(e.toString()));
      } finally {
        loadImage = false;
      }
    }
  }

}
