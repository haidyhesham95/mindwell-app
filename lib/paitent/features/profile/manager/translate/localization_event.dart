part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();
}

class ChangeLanguageEvent extends LocalizationEvent {
  final Locale locale;

  const ChangeLanguageEvent(this.locale);

  @override
  List<Object> get props => [locale];
}