import 'package:mindwell/paitent/features/note/model/note_model.dart';
import 'package:mindwell/shared_features/feed/model/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/profile/model/patient_model.dart';

import '../../doctor/features/doctor_profile/model/doctormodel.dart';
import '../../paitent/features/profile/model/questin_model.dart';

PatientModel? patientModel;
DoctorModel? doctorModel;
QuestionModel? questionModel;
ArticlesModel?articlesModel;

NoteModel? noteModel;
const kReminder = 'alarm_Box';
TextEditingController titleController = TextEditingController();

abstract class Constants {
  static String userType = 'patient';

  static bool isVisible = true;
}
