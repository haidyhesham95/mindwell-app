import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../alarm_service.dart';
import '../manager/alarm_cubit.dart';
import 'delete_dialog.dart';

class AlarmList extends StatelessWidget {
  const AlarmList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlarmCubit, AlarmState>(
      builder: (context, state) {
        if (state is HasData) {
          return FutureBuilder(
            future: BlocProvider.of<AlarmCubit>(context).list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  body: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              DeleteWarningDialog(() {
                                MyAlarm.deleteAlarm(snapshot.data![index].alarmId, context);
                              }, context);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '${snapshot.data![index].hour}:${snapshot.data![index].min}',
                                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                            color: Colors.black54,
                                            fontSize: 30,
                                          )),
                                  TextSpan(
                                      text: " ${snapshot.data![index].period}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(color: Colors.black54, fontSize: 17))
                                ])),
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data![index].title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 15, height: 0, color: Colors.black54),
                                    ),
                                    Text(
                                      '${snapshot.data![index].day}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 10, height: 0, color: Colors.black54),
                                    )
                                  ],
                                ),
                                // Switch(
                                //   hoverColor: Colors.white,
                                //   activeTrackColor: Colors.white,
                                //   thumbColor: const MaterialStatePropertyAll(
                                //       ColorsAsset.kBrown),
                                //   inactiveThumbColor: Colors.grey,
                                //   inactiveTrackColor: Colors.grey.withOpacity(.1),
                                //   trackOutlineColor:
                                //   const MaterialStatePropertyAll(
                                //     Colors.transparent,
                                //   ),
                                //   value: true,
                                //   onChanged: (value) {
                                //     value =false;
                                //     // Alarm.stop(int.parse(snapshot.data![index].alarmId));
                                //
                                //   },
                                // )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text("No Data"));
              }
            },
          );
        } else {
          return Container();
        }
      },
      listener: (context, state) {},
    );
  }
}
