import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/shared_features/appbar/appbar.dart';
import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../../doctor_profile/manager/doctor_profile/doctor_profile_cubit.dart';
import '../widgets/profile_image.dart';
import '../widgets/submit_button.dart';
import '../widgets/textfield.dart';

class EditProfileDoctor extends StatelessWidget {
  const EditProfileDoctor({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorProfileCubit, DoctorProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        DoctorProfileCubit cubit = DoctorProfileCubit.get(context);
        return Scaffold(
          appBar: customAppBar(getLang(context, 'Edit Profile'),),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    state is ChangeImageLoading?
                    const Center(
                      child: CircularProgressIndicator(
                        color: ColorsAsset.kBrown,
                      ),
                    ):
                    profileImage(cubit,context),
                    const SizedBox(height: 30.0),
                    textField(
                      onChanged: cubit.onChangeName,
                      controller: cubit.nameController,
                      labelText: getLang(context, 'Edit your name'),
                      hintText: getLang(context, 'Edit your name'),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 15.h),
                    textField(
                      onChanged: cubit.onChangeBio,
                      controller: cubit.bioController,
                      labelText: getLang(context, 'Edit your bio'),
                      hintText: getLang(context, 'Edit your bio'),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 15.h),
                    textField(

                      onChanged: cubit.onChangeSpeciality,
                      controller: cubit.specialtyController,
                      labelText: getLang(context, 'Edit your specialty'),
                      hintText: getLang(context, 'Edit your specialty'),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 50.h),
                    submitButton(cubit,context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }}