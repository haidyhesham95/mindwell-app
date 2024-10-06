import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_state.dart';

// class AppSettingsCubit extends Cubit<AppSettingsState> {
//   AppSettingsCubit() : super(AppSettingsInitial());
//
//   static AppSettingsCubit get(context) => BlocProvider.of(context);
//
//
//
//   Locale appLocale = const Locale("en");
//
//   void changeAppLanguage(Locale locale) {
//     appLocale = locale;
//     emit(AppSettingsChangeLanguageState(locale: locale));
//   }
//
//
//
// }

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsInitial());

  static AppSettingsCubit get(context) => BlocProvider.of(context);

  final String _localeKey = 'app_locale';
  late SharedPreferences _prefs;

  Locale appLocale = const Locale("en");

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final String? savedLocale = _prefs.getString(_localeKey);
    if (savedLocale != null) {
      appLocale = Locale(savedLocale);
    }
  }

  void changeAppLanguage(Locale locale) async {
    appLocale = locale;
    emit(AppSettingsChangeLanguageState(locale: locale));
    // await _prefs.setString(_localeKey, locale.languageCode);
  }
}

// class AppSettingsCubit extends Cubit<AppSettingsState> {
//   AppSettingsCubit() : super(AppSettingsInitial());
//   AppSettingsCubit appSettingsCubit = AppSettingsCubit();
//
//   static final _languageController = StreamController<Locale>.broadcast();
//
//   static AppSettingsCubit get(context) => BlocProvider.of(context);
//
//   final String _localeKey = 'app_locale';
//   late SharedPreferences _prefs;
//
//   Locale appLocale = const Locale("en");
//
//   Stream<Locale> get languageStream => _languageController.stream;
//
//   Future<void> initSharedPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//     final String? savedLocale = _prefs.getString(_localeKey);
//     if (savedLocale != null) {
//       appLocale = Locale(savedLocale);
//     }
//   }
//
//   void changeAppLanguage(Locale locale) async {
//     appLocale = locale;
//     emit(AppSettingsChangeLanguageState(locale: locale));
//     await _prefs.setString(_localeKey, locale.languageCode);
//
//     await translateData();
//   }
//
//   Future<void> translateData() async {
//     print('Translating data...');
//     emit(AppSettingsTranslationInProgress());
//
//     emit(AppSettingsTranslationComplete());
//   }
//
//   void notifyTranslationCompleted() {
//     _languageController.sink.add(appLocale);
//   }
// }
