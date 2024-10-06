
import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/reminder/widgets/alarm_list.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),


          Align(
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage('assets/reminder.png'))
          ),
          SizedBox(height: 50,),
          Expanded(child: AlarmList()),

        ],
      ),
    );
  }
}