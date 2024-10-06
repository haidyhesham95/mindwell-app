import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

abstract class MainFunctions {
  static void showSimpleNotification() async {
    List<String> motivation = [
      "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
      "Success is not final; failure is not fatal. It's the courage to continue that counts.",
      "Don't wait for the perfect moment. Take the moment and make it perfect.",
      "Your determination and hard work today will pave the way for a better tomorrow.",
      "Challenges are what make life interesting. Overcoming them is what makes life meaningful.",
      "You are capable of achieving great things. Believe in yourself, stay positive, and never give up.",
      "Your dreams are worth chasing. Stay focused, stay dedicated, and turn them into reality.",
    ];
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    int randomIndex = Random().nextInt(motivation.length);
    var randomMessage = motivation[randomIndex];
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      randomIndex,
      'Tip of the Day',
      randomMessage,
      notificationDetails,
    );
  }

  static void callbackDispatcher() async {
    print('k');

    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    Workmanager().executeTask((task, inputData) async {
      showSimpleNotification();
      print(task);
      print('task');
      if (task.toString() == 'periodicNotification') {
        print('object');
        Timer.periodic(const Duration(hours: 8), (timer) async {
          showSimpleNotification();
        });
      }
      return Future.value(true);
    });
  }

  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );
  }

  static Future<void> onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    Timer.periodic(const Duration(seconds: 15,), (timer) async {
      showSimpleNotification();
    });
  }

  static Future<bool> onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    return true;
  }
}

// class AppLifecycleObserver extends WidgetsBindingObserver {
//   getConnectivity(){
//     streamSubscription = Connectivity().onConnectivityChanged.listen(
//             (ConnectivityResult result) async{
//               isDeviceConnected= await InternetConnectionChecker().hasConnection;
//               if(!isDeviceConnected && isAlertSet==false ){
//                 ConnectivityDialog.showNoInternetDialog();
//                 isAlertSet=true;
//                 print("connectivity--------------------");
//
//               }
//             }
//     );
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       getConnectivity();
//
//     } else if (state == AppLifecycleState.paused) {
//       streamSubscription.cancel();
//     }
//   }
// }

// Future<void> checkConnectivity() async {
//   var connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult != ConnectivityResult.none) {
//     // Connected to the internet
//     print('Connected');
//   } else {
//     // Not connected to the internet
//     print('Disconnected');
//     ConnectivityDialog.showNoInternetDialog();
//   }
//
//   // Listen for connectivity changes
//   Connectivity().onConnectivityChanged.listen((connectivityResult) {
//     if (connectivityResult != ConnectivityResult.none) {
//       // Connected to the internet
//       print('Connected');
//     } else {
//       // Not connected to the internet
//       print('Disconnected');
//       ConnectivityDialog.showNoInternetDialog();
//     }
//   });
// }

// late StreamSubscription streamSubscription;
// var isDeviceConnected = false;
// bool isAlertSet =false;
