import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../manager/lang/app_settings_cubit.dart';

class LangDialog extends StatelessWidget {
  const LangDialog({super.key,});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (BuildContext context, state) {
      AppSettingsCubit cubit = AppSettingsCubit.get(context);
      return AlertDialog(
      title: Center(
        child: Text(
          getLang(context, 'Change Language'),style: Styles.textStyle20Bold,),
      ),
      alignment: Alignment.center,
      actions: [
        Center(
          child: Container(
            width: 140.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: ColorsAsset.kBrown,
                width: 1.5,
              ),
              color: ColorsAsset.kWhite.withOpacity(0.6),
            ),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(20),
              icon: const Icon(Icons.language,color: ColorsAsset.kBrown,),

              padding: const EdgeInsets.symmetric(
                  horizontal: 15),
              dropdownColor: ColorsAsset.kGround,
              underline: const SizedBox(),
              iconSize: 30,
              isExpanded: true,
              value: AppSettingsCubit.get(context)
                  .appLocale
                  .languageCode,
              items: const [
                DropdownMenuItem(
                    value: 'en',
                    child: Text('English')),
                DropdownMenuItem(
                    value: 'ar',
                    child: Text('اللغة العربية')),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  cubit.changeAppLanguage(Locale(value));
                }
              },
            ),
          ),
        ),
      ],
    );
  });




  }
}
