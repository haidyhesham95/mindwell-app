import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_features/chat/manager/chat_cubit.dart';

import 'package:mindwell/shared_utils/styles/colors.dart';

import '../widgets/doctors_list.dart';
import '../widgets/find_doctor_appbar.dart';

class ChatWithDoctor extends StatelessWidget {
  const ChatWithDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getUsers(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ChatCubit cubit = ChatCubit.get(context);
          return Scaffold(
            backgroundColor: ColorsAsset.kWhite,
            appBar: findDoctorAppbar(context),
            body: doctorsList(cubit.allUsers, context),
          );
        },
      ),
    );
  }}