part of 'alarm_cubit.dart';

@immutable
abstract class AlarmState {}

class AlarmInitial extends AlarmState {}

class NoData extends AlarmState{}
class HasData extends AlarmState{}
class AddState extends AlarmState{}
class RemoveState extends AlarmState{}
class EnableState extends AlarmState{}
class DisableState extends AlarmState{}
