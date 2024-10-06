import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:mindwell/shared_features/auth/models/signup_model.dart';
import 'package:mindwell/shared_features/auth/manger/cubit/auth_cubit.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: ColorsAsset.kGround,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 30.w > 5 ? 25.w : 5,
                          ),
                          child: Text(
                            getLang(context, 'Welcome'),
                            style: Styles.textStyle35,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 30.w > 5 ? 25.w : 5,
                          ),
                          child: Text(
                          getLang(context, 'We are glad you will join us '),
                            style: GoogleFonts.courgette(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 550.h > 550 ? 550.h : 550,
                      width: 300.w > 200 ? 320.w : 300,
                      decoration: BoxDecoration(
                          color: ColorsAsset.kWhite.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          )),
                      child: Form(
                        key: cubit.signUpFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 80.w > 300 ? 80.w : 300,
                              child: MyTextField(
                                  errorMessage: getLang(context, "Please insert your name"),
                                  controller: cubit.nameController,
                                  prefixIcon: const Icon(IconlyLight.profile),
                                  hintText: getLang(context, "Enter Your Name"),
                                  keyboardType: TextInputType.name,
                                  obscureText: false),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 80.w > 300 ? 80.w : 300,
                              child: MyTextField(
                                  errorMessage: getLang(context, "Please insert your phone"),
                                  controller: cubit.phoneController,
                                  prefixIcon: const Icon(Icons.phone),
                                  hintText: "+02********",
                                  keyboardType: TextInputType.phone,
                                  obscureText: false),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 80.w > 300 ? 80.w : 300,
                              child: MyTextField(
                                  errorMessage: getLang(context, "Please insert an email"),
                                  controller: cubit.emailSignUpController,
                                  prefixIcon: const Icon(IconlyLight.message),
                                  hintText: '@gmail.com',
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: false),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                                width: 80.w > 300 ? 80.w : 300,
                                child: MyTextField(
                                  errorMessage: getLang(context, "Please insert a password"),
                                  controller: cubit.passwordSignUpController,
                                  prefixIcon: const Icon(IconlyLight.lock),
                                  hintText: '**********',
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: cubit.isShowSignUpPassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      cubit.changeSignUpPasswordVisibility();
                                    },
                                    child: Visibility(
                                      visible: !cubit.isShowSignUpPassword,
                                      replacement: const Icon(Icons.visibility_off),
                                      child: const Icon(Icons.visibility),
                                    ),
                                  ),
                                )),
                            // SizedBox(
                            //   height: 15.h,
                            // ),
                            // Container(
                            //   width: 140.w,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(18),
                            //     border: Border.all(
                            //       color: ColorsAsset.kBrown,
                            //       width: 1.5,
                            //     ),
                            //     color: ColorsAsset.kWhite.withOpacity(0.6),
                            //   ),
                            //   child: DropdownButton(
                            //     padding: const EdgeInsets.symmetric(horizontal: 15),
                            //     dropdownColor: ColorsAsset.kGround,
                            //     borderRadius: BorderRadius.circular(8),
                            //     underline: const SizedBox(),
                            //     iconSize: 30,
                            //     isExpanded: true,
                            //     items:  [
                            //       DropdownMenuItem(value: 'patient', child: Text(getLang(context, "patient"))),
                            //       DropdownMenuItem(value: 'doctor', child: Text (getLang(context, "doctor"))),
                            //     ],
                            //     value: Constants.userType,
                            //     onChanged: (value) {
                            //       cubit.changeUserType(value);
                            //     },
                            //   ),
                            // ),
                            const SizedBox(
                              height: 70,
                            ),
                            cubit.isLoadingSignUp
                                ? const CircularProgressIndicator(
                                    color: ColorsAsset.kBrown,
                            )
                                : SizedBox(
                                    width: 80.w > 220 ? 55.w : 220,
                                    child: MyButton(
                                      onpressed: () {
                                        if (cubit.signUpFormKey.currentState!.validate()) {
                                          cubit.signup(context,
                                              signupModel: SignupModel(
                                                  token: '',
                                                  email: cubit.emailSignUpController.text,
                                                  name: cubit.nameController.text,
                                                  type: Constants.userType,
                                                  image: '',
                                                  phone: cubit.phoneController.text),
                                              password: cubit.passwordSignUpController.text);
                                        }
                                      },
                                      text: getLang(context, "Sign Up"),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
