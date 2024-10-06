import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:mindwell/shared_features/auth/manger/cubit/auth_cubit.dart';
import 'package:mindwell/shared_features/auth/widgets/custom_button.dart';
import 'package:mindwell/shared_features/auth/widgets/custom_textfield.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../../paitent/features/profile/manager/lang/app_settings_cubit.dart';
import '../../../../paitent/features/profile/widgets/lang_dialog.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/utils/connectivity_service.dart';
import '../../signup/view/signupview.dart';
import '../../widgets/Custom_TextButton.dart';
import '../../widgets/animation_rout.dart';

class LoginView2 extends StatelessWidget {
  const LoginView2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ConnectivityService connectivityService = ConnectivityService();
    ConnectivityService.connectivityCheck();
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return SafeArea(
            child: StreamBuilder<ConnectivityResult>(
                stream: connectivityService.connectionStatusController.stream,
                builder: (context, snapshot) {
                  return Scaffold(
                    backgroundColor: ColorsAsset.kGround,
                    body: Stack(
                      children: [

                        SingleChildScrollView(
                          child: Column(
                            children: [

                              AppSettingsCubit.get(context).appLocale == const Locale('en')?
                              SizedBox(
                                  height: 300.h > 300 ? 300.h : 300,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/login.jpg',
                                    fit: BoxFit.fill,
                                  )): SizedBox(
                                  height: 300.h > 300 ? 300.h : 300,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/login Arabic.png',
                                    fit: BoxFit.fill,
                                  )),
                              Form(
                                key: cubit.formKey,
                                child: Column(
                                  children: [
                                    Align(
                                     alignment: Alignment.centerLeft,
                                      widthFactor: 2,
                                      child: Text(
                                        getLang(context,"Welcome Back"),
                                       // "Welcome Back",
                                        style: Styles.textStyle28,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    MyTextField(
                                      errorMessage:
                                      getLang(context, "Please insert an email"),
                                      controller: cubit.emailLoginController,
                                      hintText:
                                      getLang(context, "Enter Your Email"),
                                      keyboardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      prefixIcon: const Icon(IconlyLight.message),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    MyTextField(
                                      errorMessage:
                                      getLang(context, "Please insert a password"),
                                      controller: cubit.passwordLoginController,
                                      hintText:
                                      //"Enter Your Password",
                                      getLang(context, "Enter Your Password"),
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: cubit.isShowLoginPassword,
                                      prefixIcon: const Icon(IconlyLight.lock),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          cubit.changeLoginPasswordVisibility();
                                        },
                                        child: Visibility(
                                          visible: !cubit.isShowLoginPassword,
                                          replacement: const Icon(Icons.visibility_off),
                                          child: const Icon(Icons.visibility),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    cubit.isLoading
                                        ? const CircularProgressIndicator(
                                      color:ColorsAsset.kBrown,
                                    )
                                        : MyButton(
                                            onpressed: () async {
                                              if (cubit.formKey.currentState!.validate()) {
                                                await cubit.login(
                                                    email: cubit.emailLoginController.text,
                                                    password: cubit.passwordLoginController.text,
                                                    context: context);
                                              }
                                            },
                                            text:
                                            //"Sign In",
                                            getLang(context, "Sign In"),
                                          ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Custom_TextButton(
                                      text:
                                      //"Dont have an account?",
                                      getLang(context, "Dont have an account?"),
                                      data:
                                      //"Sign Up",
                                      getLang(context, "Sign Up"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(SliderRight(page:const SignUpPage()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (snapshot.data == ConnectivityResult.none)
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsAsset.kWhite,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 100,
                              width: 300,
                              child:  Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    getLang(context, 'No Internet Connection'),

                                    style: const TextStyle(color: ColorsAsset.kBrown, fontWeight: FontWeight.bold),
                                  ),
                                  Text(

                                      getLang(context, 'Please check your internet connection'),
                                      style: const TextStyle(color: ColorsAsset.kBrown)),
                                ],
                              )),
                            ),
                          ),

                        Positioned(
                          top: 5.h,
                          left: 5.w,
                          child: Row(
                            children: [
                              Text(getLang(context, "EN"),style: Styles.textStyle20Bold.copyWith(color: ColorsAsset.kBrown),),

                              IconButton(
                                  onPressed:() {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const LangDialog();
                                      },
                                    );
                                  } ,
                                  icon:const Icon( Icons.language,color:ColorsAsset.kBrown ,size: 30,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
