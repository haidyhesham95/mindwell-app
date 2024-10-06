
part of 'app_settings_cubit.dart';

@immutable
abstract class AppSettingsState {}

class AppSettingsInitial extends AppSettingsState {}
class ChangeLangAr extends AppSettingsState {}
class ChangeLangEn extends AppSettingsState {}
// class AppSettingsTranslationInProgress extends AppSettingsState {}
// class AppSettingsTranslationComplete extends AppSettingsState {}


class AppSettingsChangeLanguageState extends AppSettingsState {
  final Locale locale;

  AppSettingsChangeLanguageState(
      {
    required this.locale
  }
  );
}
