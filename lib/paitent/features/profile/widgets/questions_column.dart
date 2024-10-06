import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

import '../../../../shared_utils/components/app_local.dart';
import '../manager/profile_cubit.dart';

class QuestionsColumn extends StatelessWidget {
  const QuestionsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getAnswers(id: patientModel!.id!),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //question
              Text(
                getLang(context, "q1"),
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 5,
              ),
              //answer
              questionModel?.q1 == null
                  ? Text(
                      getLang(context, "No Answer yet, please answer this question"),
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    )
                  : Text(
                      questionModel!.q1!,
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    ),
              const SizedBox(
                height: 10,
              ),
              //question
              Text(
                getLang(context, "q2"),
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 5,
              ),
              //answer
              questionModel?.q2 == null
                  ? Text(
                      getLang(context, "No Answer yet, please answer this question"),
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    )
                  : Text(questionModel!.q2!,
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown)),
              const SizedBox(
                height: 10,
              ),
              //question
              Text(
                getLang(context, "q3"),
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 5,
              ),
              //answer
              questionModel?.q3 == null
                  ? Text(
                      getLang(context, "No Answer yet, please answer this question"),
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    )
                  : Text(questionModel!.q3!,
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown)),
              const SizedBox(
                height: 10,
              ),
              //question
              Text(
                getLang(context, "q4"),
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 5,
              ),
              //answer
              questionModel?.q5 == null
                  ? Text(
                      getLang(context, "No Answer yet, please answer this question"),
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    )
                  : Text(questionModel!.q4!,
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown)),
              const SizedBox(
                height: 10,
              ),
              //question
              Text(
                getLang(context, "q5"),
                style: Styles.textStyle15black,
              ),
              const SizedBox(
                height: 5,
              ),
              //answer
              questionModel?.q5 == null
                  ? Text(
                      getLang(context, "No Answer yet, please answer this question"),
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    )
                  : Text(questionModel!.q5!,
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown)),
              const SizedBox(
                height: 10,
              ),
              //question
              Text(
                getLang(context, "q6"),
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 5,
              ),
              //answer
              questionModel?.q6 == null
                  ? Text(
                      getLang(context, "No Answer yet, please answer this question"),
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown),
                    )
                  : Text(questionModel!.q6!,
                      style: Styles.textStyle15black.copyWith(color: ColorsAsset.kBrown)),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
