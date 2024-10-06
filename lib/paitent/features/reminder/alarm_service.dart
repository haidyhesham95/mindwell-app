import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/alarm_cubit.dart';
import 'model/reminder_model.dart';

class MyAlarm {
  static void setAlarm(
    TimeOfDay picker, {
    required TimeOfDay? time,
    required BuildContext? context,
    DateTime? date,
    required String title,
  }) {
    final timeOfDay = time;
    final nextDay = DateTime.now().add(const Duration(days: 1));
    var dateTime = DateTime(date!.year, date.month, date.day, timeOfDay!.hour, timeOfDay.minute);
    if (dateTime.isBefore(DateTime.now())) {
      dateTime = nextDay;
    }
    int alarmId = Random().nextInt(100);
    final alarmSettings = AlarmSettings(
      id: alarmId,
      dateTime: dateTime,
      assetAudioPath: 'assets/audio/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volumeMax: true,
      fadeDuration: 3.0,
      notificationTitle: title, // Use the provided title parameter
      notificationBody: 'Tap to stop',
      enableNotificationOnKill: true,
      stopOnNotificationOpen: true,
    );
    Alarm.set(alarmSettings: alarmSettings).then((value) {
      BlocProvider.of<AlarmCubit>(context!).helper.insert(AlarmModel(
            key: alarmId.toString(),
            hour: time!.hourOfPeriod.toString(),
            period: time.period.name,
            min: time.minute.toString(),
            day: 'set at day ${date.day}',
            isEnabled: 'true',
            alarmId: alarmId.toString(),
            title: title, // Use the provided title parameter
          ));
    }).then((value) {
      BlocProvider.of<AlarmCubit>(context!).getData();
    });
  }

  static void deleteAlarm(alarmId, context) {
    Alarm.stop(int.parse(alarmId).toInt()).then((value) {
      BlocProvider.of<AlarmCubit>(context).helper.delete(alarmId);
      BlocProvider.of<AlarmCubit>(context).getData();
      Navigator.of(context).pop();
    });
  }
}
