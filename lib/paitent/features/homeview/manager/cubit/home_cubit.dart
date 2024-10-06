import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/homeview/model/illness_model.dart';
import 'package:mindwell/shared_utils/network/remote/api/http_helper.dart';

import '../../../../../shared_utils/utils/constant.dart';
import '../../../profile/manager/lang/app_settings_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<IllnessModel> illness = [];
  List<IllnessModel> searchList = [];
  bool isSearching = false;

  void cancelVisibility() {
    Constants.isVisible = false;
    emit(Changevisibality());
  }

  void changeSearch(bool isSearch) {
    isSearching = isSearch;
    emit(ChangeSearch());
  }

  void searchDisease(String value) {
    searchList = [];
    for (var element in illness) {
      print(element.name!.trim().toLowerCase());
      if (element.name!.trim().toLowerCase().startsWith(value.trim().toLowerCase())) {
        searchList.add(element);
        emit(GetData());
      }
    }
  }

  void getdata(context) {
    Map<String, dynamic> illnessMap;
    emit(Loading());
    FirebaseFirestore.instance.collection("Diseases").get().then((value) async {
      for (var element in value.docs) {
        if (AppSettingsCubit.get(context).appLocale == const Locale('en')) {
          illnessMap = element.data();
        } else {
          illnessMap = {
            'name': await Translate.translate(element.data()['name']),
            'Symptoms': await Translate.translate(element.data()['Symptoms']),
            'identification': await Translate.translate(element.data()['identification']),
            'reasons': await Translate.translate(element.data()['reasons']),
            'whentoseedoctor': await Translate.translate(element.data()['whentoseedoctor']),
            'treatment': await Translate.translate(element.data()['treatment']),
          };
        }
        illness.add(IllnessModel.fromJson(
          illnessMap,
        ));
      }
      emit(GetData());
    });
  }

  // void getdata(AppSettingsCubit appSettingsCubit) {
  //   emit(Loading());
  //   FirebaseFirestore.instance.collection("Diseases").get().then((value) async {
  //     for (var element in value.docs) {
  //       var name = element.data()['name'];
  //       await Translate.translate(name).then((translatedName) async {
  //         illness.add(IllnessModel.fromJson(element.data(), translatedName));
  //         emit(GetData());
  //         appSettingsCubit.notifyTranslationCompleted();
  //       });
  //     }
  //   });
  // }

  String changeImage() {
    List<String> imageUrls = [
      'assets/daily/1.png',
      'assets/daily/2.png',
      'assets/daily/3.png',
      'assets/daily/4.png',
      'assets/daily/5.png',
      'assets/daily/6.png',
      'assets/daily/7.png',
      'assets/daily/8.png',
      // Add more image URLs as needed
    ];

    Random random = Random();
    String randomImageUrl = imageUrls[random.nextInt(imageUrls.length)];

    return randomImageUrl;
  }
}
