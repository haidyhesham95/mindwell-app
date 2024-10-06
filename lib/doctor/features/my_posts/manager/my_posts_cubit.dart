import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared_features/feed/model/post_model.dart';
import '../../../../shared_utils/utils/constant.dart';

part 'my_posts_state.dart';

class MyPostsCubit extends Cubit<MyPostsState> {
  MyPostsCubit() : super(MyPostsInitial());
  static MyPostsCubit get(context) => BlocProvider.of(context);
  List<PostModel> doctorPosts = [];

void getDoctorPost() {
  FirebaseFirestore.instance
      .collection('doctors')
      .doc(doctorModel!.id)
      .collection('posts')
      .get()
      .then((value) {
    for (var element in value.docs) {
      element.reference.get().then((value) {
        doctorPosts.add(PostModel.fromJson(value.data()));
        emit(GetDoctorPosts());
      });
    }
  });
}


}
