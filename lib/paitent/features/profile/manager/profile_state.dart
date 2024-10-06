part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class SendAnswers extends ProfileState {}
class GEtAnswers extends ProfileState {}
class ChangeImage extends ProfileState {}
class GetMyDAta extends ProfileState {}
class EditName extends ProfileState {}
class ChangeImageLoading extends ProfileState {}
class GetUserDataSuccessfully extends ProfileState {}
class ChangeInformation extends ProfileState {}


