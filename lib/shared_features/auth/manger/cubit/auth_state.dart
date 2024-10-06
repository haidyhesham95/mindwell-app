part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class ChangeUserValue extends AuthState {}

class ShowPasswordInLogin extends AuthState {}

class ShowPasswordInSignUp extends AuthState {}

class IsLoading extends AuthState {}
class AppSettingsChangeLanguageState extends AuthState {
  final Locale locale;

  AppSettingsChangeLanguageState(
      {
        required this.locale
      }
      );
}
