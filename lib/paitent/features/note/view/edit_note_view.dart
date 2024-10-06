import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/note/manager/note_cubit.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import '../../../../shared_features/appbar/appbar.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../Widget/const_button.dart';
import '../Widget/const_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.oldTitle, required this.oldSubTitle, required this.docId}) : super(key: key);
  final String  oldTitle;
  final String  oldSubTitle;
  final String docId;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NoteCubit(),
      child: BlocConsumer<NoteCubit,NoteState>(
        listener: (context, state) {
        },
        builder: (context, state){
          NoteCubit cubit = NoteCubit.get(context);
          return Scaffold(
          backgroundColor: ColorsAsset.kWhite,
            appBar: customAppBar(getLang(context, "Edit Note"),),
          body:   SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Center(
                  child: Container(
                    height: 550.h > 550 ? 550.h : 550 ,
                    width:  300.w > 200 ? 320.w : 300 ,
                    decoration: const BoxDecoration(
                      color: ColorsAsset.kGround,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 80.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstTextField(
                              controller:cubit.titleController ,
                              onChanged: cubit.onChangeTitle,
                              hintText:oldTitle

                          ),
                          SizedBox(height: 20.h,),
                          ConstTextField(
                            controller: cubit.subTitleController,
                            onChanged: cubit.onChangeSubTitle,
                            hintText:oldSubTitle,
                            maxLines: 5,
                          ),

                          SizedBox(height: 80.h,),
                          ConstButton(text: getLang(context, "Edit"),height: 40.h,
                            onTap:(){
                             cubit.editNote();
                             Navigator.pop(context);
                              })



                        ],
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        );
      },
      ),
    );
  }
}
