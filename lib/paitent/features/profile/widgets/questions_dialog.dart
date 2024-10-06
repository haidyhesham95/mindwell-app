import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/profile/widgets/button.dart';
import 'package:mindwell/paitent/features/profile/widgets/textfield_question.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';
import '../manager/profile_cubit.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return AlertDialog(
            backgroundColor: ColorsAsset.kWhite,
            title: Text(
                getLang(context,'Answer these questions so we can help you')),
            titleTextStyle: Styles.textStyle15black,
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    getLang(context, "q1"),
                    style: Styles.textStyle15black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldQuestion(controller: cubit.q1Controller),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    getLang(context, "q2"),
                    style: Styles.textStyle15black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldQuestion(controller: cubit.q2Controller),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    getLang(context, "q3"),
                    style: Styles.textStyle15black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldQuestion(controller: cubit.q3Controller),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    getLang(context, "q4"),
                    style: Styles.textStyle15black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldQuestion(controller: cubit.q4Controller),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    getLang(context, "q5"),
                    style: Styles.textStyle15black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldQuestion(controller: cubit.q5Controller),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    getLang(context, "q6"),
                    style: Styles.textStyle15black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldQuestion(controller: cubit.q6Controller),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MyProfileButton(
                text: getLang(context, "Submit"),
                onpressed: () {
                  cubit.sendQuestionsAnswer(
                      id: patientModel!.id!,
                      question1: cubit.q1Controller.text,
                      question2: cubit.q2Controller.text,
                      question3: cubit.q3Controller.text,
                      question4: cubit.q4Controller.text,
                      question5: cubit.q5Controller.text,
                      question6: cubit.q6Controller.text);
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      ),
    );
  }
}
