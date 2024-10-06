import 'package:hive/hive.dart';
part 'reminder_model.g.dart';
class AlarmModel {
  String? key;
  String? hour;
  String? min;
  String? period;
  String? title;
  String? day;
  String? isEnabled;
  String? alarmId;
  // String? userId;

  AlarmModel(
      {required this.key,
        required this.hour,
        required this.period,
        required this.min,
        required this.day,
        required this.isEnabled,
        required this.alarmId,
        required this.title,
        // required this.userId
      });

  AlarmModel.fromMap(Map<String, dynamic> map) {
    key=map['key'];
    hour = map['hour'];
    min = map['min'];
    period = map['period'];
    title = map['title'];
    day = map['day'];
    isEnabled = map['isEnabled'];
    alarmId=map['alarmId'];
    // userId=map['userId'];
  }

  Map<String, Object?> toMap() {
    return {
      'key' : key,
      'hour': hour,
      'min': min,
      'period': period,
      'title': title,
      'day': day,
      'isEnabled': isEnabled,
      'alarmId' : alarmId
      // 'userId' : userId
    };
  }
}

// @HiveType(typeId: 0)
// class AlarmModel extends HiveObject{
//   @HiveField(0)
//   String? key;
//   @HiveField(1)
//   String? hour;
//   @HiveField(2)
//   String? min;
//   @HiveField(3)
//   String? period;
//   @HiveField(4)
//   String? title;
//   @HiveField(5)
//   String? day;
//   @HiveField(6)
//   String? isEnabled;
//   @HiveField(7)
//   String? alarmId;
//
//   AlarmModel(
//       {required this.key,
//         required this.hour,
//         required this.period,
//         required this.min,
//         required this.day,
//         required this.isEnabled,
//         required this.alarmId,
//         required this.title});
//
//   AlarmModel.fromMap(Map<String, dynamic> map) {
//     key=map['key'];
//     hour = map['hour'];
//     min = map['min'];
//     period = map['period'];
//     title = map['title'];
//     day = map['day'];
//     isEnabled = map['isEnabled'];
//     alarmId=map['alarmId'];
//   }
//
//   Map<String, Object?> toMap() {
//     return {
//       'key' : key,
//       'hour': hour,
//       'min': min,
//       'period': period,
//       'title': title,
//       'day': day,
//       'isEnabled': isEnabled,
//       'alarmId' : alarmId
//     };
//   }
// }
