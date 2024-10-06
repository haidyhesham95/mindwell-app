part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class GetDoctors extends ChatState {}
class GetDoctorsDetails extends ChatState {}
class GetPatientsDetails extends ChatState {}
class GetPatients extends ChatState {}
class Get extends ChatState {}
class Cleartextfield extends ChatState {}
class GetPriviteUsers extends ChatState {}
