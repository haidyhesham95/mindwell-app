import 'package:flutter/material.dart';

import '../features/profile/manager/lang/app_settings_cubit.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "assets/appbar.png",
          height: 50,
        ),
      ),
      body:  AppSettingsCubit.get(context).appLocale == const Locale('en')?
      Center(
        child: Image.asset("assets/2 English.png"),
      ):
      Center(
        child: Image.asset("assets/2.png"),
      )
    );
  }
}
