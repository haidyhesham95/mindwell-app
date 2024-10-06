// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmModelAdapter extends TypeAdapter<AlarmModel> {
  @override
  final int typeId = 0;

  @override
  AlarmModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlarmModel(
      key: fields[0] as String?,
      hour: fields[1] as String?,
      period: fields[3] as String?,
      min: fields[2] as String?,
      day: fields[5] as String?,
      isEnabled: fields[6] as String?,
      alarmId: fields[7] as String?,
      title: fields[4] as String?,
      // userId: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AlarmModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.hour)
      ..writeByte(2)
      ..write(obj.min)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.day)
      ..writeByte(6)
      ..write(obj.isEnabled)
      ..writeByte(7)
      ..write(obj.alarmId);
      // ..writeByte(8)
      // ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
