import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/note/manager/note_cubit.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../../../../shared_features/appbar/appbar.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../Widget/floating_button_note.dart';
import '../Widget/note_gridview.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getNote(),
      child: BlocConsumer<NoteCubit,NoteState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: customAppBar(getLang(context, "My Notes")),
              body:NoteCubit.get(context).notes.isEmpty?
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/no post.gif'),
                    Text(getLang(context, "There's nothing in here"), style: Styles.textStyle25),
                  ],
                ),
              ): Padding(
                padding: EdgeInsets.only(top: 40.h, left: 8.w, right: 8.w, bottom: 10.h),
                child:  const NoteGrid(),
              ),
              floatingActionButton: const FloatingButtonNote());
        },
      ),
    );
  }
}
