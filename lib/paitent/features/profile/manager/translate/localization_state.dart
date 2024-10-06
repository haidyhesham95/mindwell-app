part of 'localization_bloc.dart';

@immutable
class LocalizationState extends Equatable {
  final Locale locale;

  const LocalizationState(this.locale);

  @override
  List<Object> get props => [locale];
}