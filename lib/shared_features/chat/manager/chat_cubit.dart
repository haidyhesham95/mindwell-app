import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mindwell/shared_features/chat/model/chat_user_model.dart';
import 'package:mindwell/paitent/features/profile/model/patient_model.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

import '../../../doctor/features/doctor_profile/model/doctormodel.dart';
import '../model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);
  TextEditingController messageController = TextEditingController();

  List<ChatUserModel> privateChatUser = [];
  final controller = ScrollController();

  


  void scrollToBottom() {
    double maxScrollExtent = controller.position.minScrollExtent;
    controller.animateTo(
      maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  List<MessageModel> messages = [];

  void getAllMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection("${Constants.userType}s")
        .doc(Constants.userType == "doctor" ? doctorModel!.id! : patientModel!.id!)
        .collection("chat")
        .doc(receiverId)
        .collection(receiverId)
        .orderBy('date')
        .snapshots()
        .listen((event) {
      messages = [];

      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }

      messages = messages.reversed.toList();
      emit(Get());
    });
  }

  void getPrivateChat() {
    if (Constants.userType == "patient") {
      FirebaseFirestore.instance
          .collection("patients")
          .doc(patientModel!.id!)
          .collection('chat')
          .snapshots()
          .listen((value) {
        privateChatUser = [];
        // emit(GetPatients());
        for (var element in value.docs) {
          privateChatUser.add(ChatUserModel.fromJson(element.data()));
        }
        emit(GetDoctors());
      });
    } else {
      FirebaseFirestore.instance
          .collection("doctors")
          .doc(doctorModel!.id!)
          .collection('chat')
          .snapshots()
          .listen((value) {
        privateChatUser = [];
        // emit(GetPatients());
        for (var element in value.docs) {
          privateChatUser.add(ChatUserModel.fromJson(element.data()));
          emit(GetPatients());
        }
      });
    }
  }

  String? message;

  void sendMessage({
    required String senderId,
    required String receiverId,
    required String type,
    required String sender,
  }) async {
    message = messageController.text;
    String? uId;
    messageController.text = "";
    emit(Cleartextfield());
    var addUserModelDataInDoctor = FirebaseFirestore.instance
        .collection('doctors')
        .doc(Constants.userType == 'doctor' ? senderId : receiverId)
        .collection('chat')
        .doc(Constants.userType == 'doctor' ? receiverId : senderId);
    var adduserModelDAtaInPatient = FirebaseFirestore.instance
        .collection('patients')
        .doc(Constants.userType == 'doctor' ? receiverId : senderId)
        .collection('chat')
        .doc(Constants.userType == 'doctor' ? senderId : receiverId);

    if (Constants.userType == 'patient') {
      await adduserModelDAtaInPatient.get().then((value) async {
        if (value.data() == null) {
          await FirebaseFirestore.instance.collection("doctors").doc(receiverId).get().then((value) {
            adduserModelDAtaInPatient.set(value.data()!);
          });
          await FirebaseFirestore.instance.collection("patients").doc(senderId).get().then((value) {
            addUserModelDataInDoctor.set(value.data()!);
          });
        }
      });
      // DateFormat("kk:mm:ss a").format(DateTime.now())
      await addUserModelDataInDoctor
          .update({'lastMessage': message, 'date': DateFormat("kk:mm:ss a").format(DateTime.now()), 'unread': true});
      await adduserModelDAtaInPatient
          .update({'lastMessage': message, 'date': DateFormat("kk:mm:ss a").format(DateTime.now()), 'unread': false});
    } else {
      await addUserModelDataInDoctor.get().then((value) async {
        if (value.data() == null) {
          await FirebaseFirestore.instance.collection("patient").doc(receiverId).get().then((value) {
            addUserModelDataInDoctor.set(value.data()!);
          });
          await FirebaseFirestore.instance.collection("doctors").doc(senderId).get().then((value) {
            adduserModelDAtaInPatient.set(value.data()!);
          });
        }
      });
      await adduserModelDAtaInPatient
          .update({'lastMessage': message, 'date': DateFormat("kk:mm:ss a").format(DateTime.now()), 'unread': true});
      await addUserModelDataInDoctor
          .update({'lastMessage': message, 'date': DateFormat("kk:mm:ss a").format(DateTime.now()), 'unread': false});
    }

    await adduserModelDAtaInPatient.collection(Constants.userType == 'doctor' ? senderId : receiverId).add({
      'date': DateTime.now().toString(),
      'text': message,
      'type': type,
      'sender': sender,
      'receiverId': receiverId,
      'senderId': senderId
    }).then((value) async {
      uId = value.id;
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(Constants.userType == 'doctor' ? receiverId : senderId)
          .collection('chat')
          .doc(Constants.userType == 'doctor' ? senderId : receiverId)
          .collection(Constants.userType == 'doctor' ? senderId : receiverId)
          .doc(uId)
          .update({'id': value.id});

      scrollToBottom();
    });

    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(Constants.userType == 'doctor' ? senderId : receiverId)
        .collection('chat')
        .doc(Constants.userType == 'doctor' ? receiverId : senderId)
        .collection(Constants.userType == 'doctor' ? receiverId : senderId)
        .doc(uId)
        .set({
      'date': DateTime.now().toString(),
      'text': message,
      'type': type,
      'sender': sender,
      'id': uId,
      'receiverId': receiverId,
      'senderId': senderId
    }).then((value) {
      scrollToBottom();
    });
  }

  List<ChatUserModel> allUsers = [];
  List<DoctorModel> doctorDetails = [];
  List<PatientModel> patientDetails = [];

  void getUsers() {
    if (Constants.userType == "patient") {
      FirebaseFirestore.instance.collection("doctors").get().then((value) {
        for (var element in value.docs) {
          allUsers.add(ChatUserModel.fromJson(element.data()));
          emit(GetDoctors());
        }
      });
    } else {
      FirebaseFirestore.instance.collection("patients").get().then((value) {
        for (var element in value.docs) {
          allUsers.add(ChatUserModel.fromJson(element.data()));
          emit(GetPatients());
        }
      });
    }
  }

  // void getUsersDetails() {
  //   if (Constants.userType == "patient") {
  //     FirebaseFirestore.instance.collection("doctors").get().then((value) {
  //       for (var element in value.docs) {
  //         patientDetails.add(PatientModel.fromJson(element.data()));
  //         emit(GetDoctors());
  //       }
  //     });
  //   } else {
  //     FirebaseFirestore.instance.collection("patients").get().then((value) {
  //       for (var element in value.docs) {
  //         doctorDetails.add(DoctorModel.fromJson(element.data()));
  //         emit(GetPatients());
  //       }
  //     });
  //   }
  // }

  void readMessage(String receiverId) {
    FirebaseFirestore.instance
        .collection('${Constants.userType}s')
        .doc(Constants.userType == "doctor" ? doctorModel!.id! : patientModel!.id!)
        .collection('chat')
        .doc(receiverId)
        .update({'unread': false}).then((value) {
      getPrivateChat();
    });
  }

  void sendPushMessage({
    required String token,
    required String body,
    required String title,
  }) async {
    print(await FirebaseMessaging.instance.getToken());
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAhQjE5IY:APA91bFlMh0aNBI7VwXMWUOrD7Gyqq18srbjo56Ohm4Z2DGi29u5h141CeTFI9EvHqDtHqzf1a31d8lQT8ySJe9VrRw6QvCJGmhiulReK_fyMjBaHP6-EcVliwJ0GZHaiyfp_HCIkpx9',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "dbfood",
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint("error push notification");
      }
    }
  }
}
