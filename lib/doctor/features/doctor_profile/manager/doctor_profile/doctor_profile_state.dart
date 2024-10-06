part of 'doctor_profile_cubit.dart';

@immutable
abstract class DoctorProfileState {}

class DoctorProfileInitial extends DoctorProfileState {}
class ChangeImage extends DoctorProfileState {}
class ChangeInformation extends DoctorProfileState {}
class EditName extends DoctorProfileState {}
class EditBio extends DoctorProfileState {}
class EditSpecialty extends DoctorProfileState {}
class GetMyData extends DoctorProfileState {}
class ChangeImageLoading extends DoctorProfileState {}
class GetDoctorDataSuccessfully extends DoctorProfileState {}
class LoadedFromLocalStorage extends DoctorProfileState {}
class DoctorInfoError extends DoctorProfileState {
  final String error;

  DoctorInfoError(this.error);
}

class DoctorProfileUpdated extends DoctorProfileState {
  final DoctorModel? doctorModel;

  DoctorProfileUpdated(this.doctorModel);
}