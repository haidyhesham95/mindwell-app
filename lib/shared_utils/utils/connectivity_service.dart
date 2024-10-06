import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnectivityService {
  static void connectivityCheck() async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      print('hfjdkslfjdkslhfjdkwvhfjdsk');
      Fluttertoast.showToast(msg: 'cheack connectivity');
    }
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        print('object');
        Fluttertoast.showToast(msg: 'no internet');
      }

    });
  }

  final Connectivity _connectivity = Connectivity();
  StreamController<ConnectivityResult> connectionStatusController = StreamController<ConnectivityResult>();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);
    });
  }

  Future<ConnectivityResult> checkConnection() async {
    return await _connectivity.checkConnectivity();
  }
}
