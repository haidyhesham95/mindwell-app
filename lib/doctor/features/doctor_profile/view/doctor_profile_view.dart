import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/doctor_profile/doctor_profile_cubit.dart';
import '../widget/background.dart';
import '../widget/profile_info.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorProfileCubit, DoctorProfileState>(
      listener: (context, state) {
        if (state is ChangeInformation) {
          DoctorProfileCubit.get(context).getMyData();
        }
      },
      builder: (context, state) {
        DoctorProfileCubit cubit = DoctorProfileCubit.get(context);

        return Scaffold(
          body: Stack(
            children: [
              backgroundImage(),
              profileInfo(cubit,context),
            ],
          ),
        );
      },
    );
  }

}
