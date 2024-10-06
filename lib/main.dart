import 'dart:convert';

import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindwell/doctor/layout/view/layout.dart';
import 'package:mindwell/main_functions.dart';
import 'package:mindwell/paitent/features/profile/manager/lang/app_settings_cubit.dart';
import 'package:mindwell/paitent/features/profile/manager/profile_cubit.dart';
import 'package:mindwell/paitent/layout/view/layout.dart';
import 'package:mindwell/shared_features/auth/login/view/login_view.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/network/local/chached_preference.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';
import 'package:provider/provider.dart';

import 'doctor/features/doctor_profile/manager/doctor_profile/doctor_profile_cubit.dart';
import 'doctor/features/doctor_profile/model/doctormodel.dart';
import 'firebase_options.dart';
import 'paitent/features/profile/model/patient_model.dart';
import 'shared_features/auth/manger/cubit/auth_cubit.dart';
import 'shared_features/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: 'AIzaSyAyq8J9URJd5YiOE02tS8bgnDPYwOrNr-I');
  Bloc.observer = MyBlocObserver();
  await FlutterBackgroundService().startService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await CacheHelper.init();
  await Alarm.init();
  await FlutterBackgroundService().configure(
    androidConfiguration: AndroidConfiguration(
      // This service is enabled by default
      onStart: MainFunctions.onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      // This service is enabled by default
      autoStart: true,
      onForeground: MainFunctions.onIosBackground,
      onBackground: MainFunctions.onIosBackground,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? patientMap = await CacheHelper.getData(key: 'patient');
  String? doctorMap = await CacheHelper.getData(key: 'doctor');
  final Widget auth;
  if (patientMap != null) {
    patientModel = PatientModel.fromJson(jsonDecode(patientMap));
    Constants.userType = 'patient';
    auth = const NavBar();
  } else if (doctorMap != null) {
    doctorModel = DoctorModel.fromJson(jsonDecode(doctorMap));
    Constants.userType = 'doctor';
    auth = const DoctorNavbar();
  } else {
    auth = const LoginView2();
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((event) {
    print(event.data['title']);
    Fluttertoast.showToast(
      msg: '${event.data['title']} send you a message',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  });
  runApp(HomePage(auth: auth));
}

class HomePage extends StatelessWidget {
  final Widget auth;

  const HomePage({
    Key? key,
    required this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<DoctorProfileCubit>(
          create: (context) => DoctorProfileCubit()..getMyData(
          ),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit()..getAnswers(id: patientModel!.id!)..getUserData(),
        ),
        BlocProvider<AppSettingsCubit>(
          create: (context) => AppSettingsCubit(),
        ),
      ],
      child: BlocConsumer<AppSettingsCubit, AppSettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, context1) {
              return GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
                child: MaterialApp(
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                      listTileTheme: const ListTileThemeData(
                          tileColor: Color(0xFFFFF6EE), titleTextStyle: TextStyle(color: ColorsAsset.kBrown)),
                      expansionTileTheme: ExpansionTileThemeData(
                          backgroundColor: const Color(0xFFFFF6EE),
                          childrenPadding: const EdgeInsets.all(10),
                          collapsedTextColor: ColorsAsset.kBrown,
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                      useMaterial3: true),
                  themeMode: ThemeMode.light,
                  debugShowCheckedModeBanner: false,
                  locale: AppSettingsCubit.get(context).appLocale,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    AppLocale.delegate
                  ],
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ar'),
                  ],
                  localeResolutionCallback: ((crlocales, supportedLocales) {
                    if (crlocales != null) {
                      for (Locale locale in supportedLocales) {
                        if (locale.languageCode == crlocales.languageCode) {
                          return locale;
                        }
                      }
                    }
                    return supportedLocales.first;
                  }),
                  home: auth,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
