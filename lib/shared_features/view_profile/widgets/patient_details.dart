import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/view_profile/widgets/user_details_text.dart';

import '../../../shared_utils/utils/constant.dart';
import 'build_questions_answer.dart';

Widget buildPatientDetails(userData) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUserDetailText('Patient Name', userData?['name'], fontWeight: FontWeight.bold, fontSize: 25),
            const SizedBox(height: 10,),
            buildQuestionAnswer('Do you prefer to solve your complex problems and confront them or run away from them?', questionModel?.q1),
            buildQuestionAnswer('What do you think about helping others in your life, and do you like providing help to others?', questionModel?.q2),
            buildQuestionAnswer('How much time do you need to calm down during anger?', questionModel?.q3),
            buildQuestionAnswer('Are you someone who gets disappointed easily and quickly?', questionModel?.q4),
            buildQuestionAnswer('Do you like having a lot of people around you or not?', questionModel?.q5),
            buildQuestionAnswer('Do you tend to be lonely a lot?', questionModel?.q6),
          ],
        ),
      ),
    ),
  );
}