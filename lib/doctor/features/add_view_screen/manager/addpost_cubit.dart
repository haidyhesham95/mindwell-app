import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_features/feed/model/post_model.dart';


part 'addpost_state.dart';



class AddPostCubit extends Cubit<AddpostState> {
  AddPostCubit() : super(AddPostInitial());

  static AddPostCubit get(context) => BlocProvider.of(context);
  TextEditingController contentController = TextEditingController();
  List<PostModel> posts = [];
  List<String> postId = [];



  void addPost({required PostModel postModel, required String id}) {
    FirebaseFirestore.instance
        .collection("doctors")
        .doc(id)
        .collection("posts")
        .doc()
        .set(postModel.toMap(id: id));
  }

  void getPost() {
    emit(Loading());
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      for (var element in value.docs) {
        element.reference.collection('posts').get().then((value) {
          for (var element in value.docs) {
            postId.add(element.id);
            element.reference.get().then((value) {
              posts.add(PostModel.fromJson(value.data()));
              emit(GetPosts());
            });
          }
        });
      }
    });
  }
}
