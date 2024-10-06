import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindwell/shared_features/feed/model/post_model.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../manager/addpost_cubit.dart';
import 'const_button.dart';
import 'const_text_field.dart';
import 'package:intl/intl.dart';


class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddpostState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          AddPostCubit cubit = AddPostCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric( horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 ConstTextField(
                  controller: cubit.contentController,
                  hintText: getLang(context, 'Content'),
                  maxLines: 5,
                ),
                SizedBox(
                  height: 80.h,
                ),
                ConstButton(
                  text: getLang(context, "Add Post"),
                  height: 40.h,
                  width: 250.w,
                  onTap: () {
                    cubit.addPost(
                        postModel: PostModel(
                        date: DateFormat("dd-MM (kk:mm a)").format(DateTime.now()),
                        content: cubit.contentController.text,
                        name: doctorModel!.name,
                        docImage:doctorModel!.image,
                        id: doctorModel!.id),
                        id: doctorModel!.id.toString());
                    cubit.contentController.clear();
                    Fluttertoast.showToast(msg: "Post added",backgroundColor: ColorsAsset.kBrown,);
                  },
                ),



              ],
            ),
          );
        },
      ),
    );
  }
}
