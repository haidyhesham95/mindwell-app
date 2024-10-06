import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/profile/widgets/button.dart';
import 'package:mindwell/shared_features/appbar/appbar.dart';
import 'package:mindwell/shared_features/auth/widgets/custom_textfield.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import '../../profile/manager/profile_cubit.dart';
import '../../profile/widgets/questions_column.dart';
import '../widgets/edit_profile_image.dart';

import 'package:mindwell/shared_utils/styles/colors.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: customAppBar(getLang(context, "Edit Profile"), ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state is ChangeImageLoading?
                  const Center(
                    child: CircularProgressIndicator(
                      color: ColorsAsset.kBrown,
                    ),
                  ):
                  profileImageSection(context, cubit),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getLang(context, "Edit Name: "),
                        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      MyTextField(
                        controller: cubit.nameController,
                        horizontal: 0,
                        keyboardType: TextInputType.name,

                        hintText: getLang(context, "Edit your name"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: MyProfileButton(
                      onpressed: () async {
                        await cubit.editName();

                        Navigator.pop(context);

                      },
                      text: getLang(context, "Submit"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    getLang(context, "Personality Analysis"),
                    textAlign: TextAlign.start,
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15.0),
                  const QuestionsColumn(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
