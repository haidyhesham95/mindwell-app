import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/chat_with_doctor/view/chat_with_doctor.dart';
import 'package:mindwell/paitent/features/profile/manager/profile_cubit.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';
import '../../../../shared_utils/components/app_local.dart';
import '../../../about_us/about_us.dart';
import '../../note/view/note_view.dart';
import '../../reminder/manager/alarm_cubit.dart';
import '../../reminder/view/reminder_view.dart';
import '../widgets/background_image.dart';
import '../widgets/lang_dialog.dart';
import '../widgets/list_tile_card.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/questions_dialog.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ChangeInformation) {
          ProfileCubit.get(context).getMyData();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              backgroundImage(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30.0),
                        profileAvatar(context),
                        const SizedBox(height: 20.0),
                        Text(patientModel!.name!,
                            style: Styles.textStyle25Bold),
                        Text(patientModel!.email!, style: Styles.textStyle15),
                        const SizedBox(height: 30.0),
                        listTileCard(
                          title: getLang(context, 'My Notes'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NoteView(),
                            ));
                          },
                        ),
                        listTileCard(
                          title: getLang(context, 'Chat With Doctor'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChatWithDoctor(),
                            ));
                          },
                        ),
                        listTileCard(
                            title: getLang(context, 'Reminder'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    BlocProvider(
                                      create: (context) => AlarmCubit(),
                                      child: const AlarmScreen(),
                                    ),
                              ));
                            }),
                        listTileCard(
                          title: getLang(context, 'About Us'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>const AboutUs())

                              );
                            }
                        ),
                        listTileCard(
                          title: getLang(context, 'Questions'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const QuestionDialog();
                              },
                            );
                          },
                        ),
                        listTileCard(
                          title: getLang(context, 'Language'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LangDialog();
                              },
                            );
                          },
                        ),

                        listTileCard(
                          title: getLang(context, 'Logout'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LogoutDialog();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
