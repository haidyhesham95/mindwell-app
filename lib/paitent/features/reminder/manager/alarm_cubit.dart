import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../alarm_service.dart';
import '../model/reminder_model.dart';
import '../sql.dart';

part 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmInitial());

  static AlarmCubit get(context) => BlocProvider.of(context);
  final DbHelper helper = DbHelper();
  late Future<List<AlarmModel>> list;

  void getData() async {
    helper.getData().then((value) {
      list = Future.value(value);
      emit(HasData());
    });
  }

  Future<void> addData(BuildContext context, TextEditingController titleController) async {
    DateTime currentDate = DateTime.now();
    var picker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Set Alarm Time",
    );
    var datepicker = await showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
      helpText: "Set Alarm Date",
      //
      initialDate: currentDate,
    );

    if (picker != null && datepicker != null) {
      String alarmTitle = titleController.text;
      MyAlarm.setAlarm(picker, context: context, date: datepicker, title: alarmTitle, time: picker);
    }
  }

  Future<Duration> getDifferenceBetweenCurrentTimeAndSelectedTime(TimeOfDay selectedTime) async {
    final now = DateTime.now();
    final selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    return selectedDateTime.difference(now);
  }
}
