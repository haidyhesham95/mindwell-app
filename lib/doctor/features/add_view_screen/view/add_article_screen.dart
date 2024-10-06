import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindwell/doctor/features/add_view_screen/manager/add_article_cubit.dart';
import 'package:mindwell/doctor/features/add_view_screen/widget/show_image_picker.dart';
import 'package:mindwell/shared_features/auth/widgets/custom_textfield.dart';

import '../../../../paitent/features/note/Widget/const_button.dart';
import '../../../../shared_features/feed/model/articles_model.dart';
import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';


class AddArticleScreen extends StatelessWidget {
  const AddArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddArticleCubit(),
      child: BlocConsumer<AddArticleCubit, AddArticleState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          AddArticleCubit cubit = AddArticleCubit.get(context);
          return  Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h,),
                      Container(
                        width: double.infinity,
                        height: 150.h,
                        decoration:  BoxDecoration(
                            color: ColorsAsset.kWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: ColorsAsset.kBrown,width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: Colors.black.withOpacity(0.15),
                              )
                            ]
                        ),
                        child: InkWell(
                          onTap: () {
                           ImagePickerUtils.showImagePicker(
                               context, () {
                                 cubit.addImage();
                                 Navigator.pop(context);
                            });

                          },child:cubit.loadImage ? Center(child: CircularProgressIndicator(
                          color: ColorsAsset.kBrown,

                        )):
                         cubit.url  == null
                              ? Image.asset('assets/add_image.png')
                              :  Image.network(cubit.url!),
                        ),
                        //Image.asset('assets/add_image.png')
                      ),
                      SizedBox(height: 70.h),
                      MyTextField(
                        controller: cubit.addNameController,
                        hintText: getLang(context, 'Add Name'),
                        keyboardType: TextInputType.text,
                        errorMessage:getLang(context, "Please add Name"),
                      ),
                      SizedBox(height: 20.h),
                      MyTextField(
                        controller: cubit.addDescriptionController,
                        hintText: getLang(context, 'Add Description'),
                        keyboardType: TextInputType.text,
                        errorMessage:getLang(context, "Please add Description"),
                      ),
                      SizedBox(height: 55.h),
                      ConstButton(
                        text: getLang(context, "Add Article"),
                        height: 42.h,
                        width: 220.w,
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.addArticle(
                                articlesModel: ArticlesModel(
                                    name: cubit.addNameController.text,
                                    description: cubit.addDescriptionController.text,
                                    image: cubit.url!,
                                    id: doctorModel!.id),
                                id: doctorModel!.id.toString());
                            Fluttertoast.showToast(msg: "Article added",backgroundColor: ColorsAsset.kBrown,);
                                   cubit.clearForm();





                            }
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}