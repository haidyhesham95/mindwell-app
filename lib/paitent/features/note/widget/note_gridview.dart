import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/note/manager/note_cubit.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/constant.dart';
import '../view/edit_note_view.dart';
import 'note_item.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        NoteCubit cubit = NoteCubit.get(context);
        if (state is LoadingNote) {
          return const Center(
              child: CircularProgressIndicator(
            color: ColorsAsset.kBrown,
          ));
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: cubit.notes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 40.h,
                crossAxisSpacing: 10.w,
                crossAxisCount: 2,
                mainAxisExtent: 205.h,
              ),
              itemBuilder: (context, index) {
                return NoteItem(
                  onTapDelete: () async {
                    cubit.deleteNote(
                      noteId: cubit.notes[index].id.toString(),
                      patientId: patientModel!.id!,
                    );
                  },
                  onTapEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  EditNoteView(
                          docId: cubit.notes[index].id.toString(),
                          oldSubTitle: cubit.notes[index].subTitle.toString(),
                          oldTitle:cubit.notes[index].title.toString(),
                        ),
                      ),
                    );
                  },
                  date: cubit.notes[index].date.toString(),
                 title: cubit.notes[index].title.toString(),
                 content: cubit.notes[index].subTitle.toString(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
