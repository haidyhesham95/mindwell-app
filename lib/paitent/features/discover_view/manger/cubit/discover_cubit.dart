import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/discover_view/model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared_utils/network/remote/api/http_helper.dart';
import '../../../profile/manager/lang/app_settings_cubit.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(DiscoverInitial());
  static DiscoverCubit get(context) => BlocProvider.of(context);
  List<BookModel> book = [];
  void getBooks(context) {
    Map<String, dynamic> bookMap;
    emit(Loading());
    FirebaseFirestore.instance.collection("books").get().then((value) async {
      for (var element in value.docs) {
        if (AppSettingsCubit.get(context).appLocale == const Locale('en')) {
          bookMap = element.data();
        } else {
          bookMap = {
            'name': await Translate.translate(element.data()['name']),
            'description': await Translate.translate(element.data()['description']),
            'author': await Translate.translate(element.data()['author']),
            'image': element.data()['image'],
            'download': await Translate.translate(element.data()['download']),
          };
        }
        book.add(BookModel.fromJson(bookMap));
        print("this is download link");
        print(element.data()["download"]);
      }
      emit(GetData());
    });
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
