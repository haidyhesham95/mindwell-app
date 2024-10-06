import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../../../shared_utils/utils/constant.dart';
import '../../profile/manager/lang/app_settings_cubit.dart';
import '../manager/alarm_cubit.dart';
import '../widgets/add_alarm_dialog.dart';
import '../widgets/alarm_list.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});
  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}
class _AlarmScreenState extends State<AlarmScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AlarmCubit>(context).getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Padding(
        padding: const EdgeInsets.all(30.0),
        child: FloatingActionButton(
          onPressed: (){
            showAddAlarmDialog(context,() async{
              await  BlocProvider.of<AlarmCubit>(context).addData(context, titleController);
              titleController.clear();
              Navigator.of(context).pop();

            },);
          },
          backgroundColor: ColorsAsset.kGround,
          child: const Icon(
            Icons.add,color: ColorsAsset.kBrown,size: 30,
          ),
        ),
      ),



      body:  SafeArea(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20,),

              AppSettingsCubit.get(context).appLocale == const Locale('en')?

              const Align(
                  alignment: Alignment.topCenter,
                  child: Image(image: AssetImage('assets/reminder.png'))
              ):
              const Align(
                  alignment: Alignment.topCenter,
                  child: Image(image: AssetImage('assets/alarm arabic.png'))
              ),
              const SizedBox(height: 50,),
              const Expanded(child: AlarmList()),

            ],
          ),
        ),
      ),
    );
  }
}
