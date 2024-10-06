import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mindwell/paitent/features/note/manager/note_cubit.dart';
import 'package:mindwell/paitent/features/note/model/note_model.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

import '../../../../doctor/features/add_view_screen/widget/top_button_sheet.dart';
import 'const_button.dart';
import 'const_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm(this.noteCubit, {super.key});

  final NoteCubit noteCubit;

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    isLoading.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    isLoading.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopButtonSheet(),
        SizedBox(
          height: 40.h,
        ),
        ConstTextField(
          hintText: getLang(context, "Title"),
          controller: widget.noteCubit.titleController,
        ),
        SizedBox(
          height: 15.h,
        ),
        ConstTextField(
          hintText: getLang(context, "Content"),
          maxLines: 5,
          controller: widget.noteCubit.subTitleController,
        ),
        SizedBox(
          height: 40.h,
        ),
        isLoading.value
            ? const CircularProgressIndicator()
            : ConstButton(
                text: getLang(context, "Add"),
                height: 40.h,
                onTap: () {
                  isLoading.value = true;
                  widget.noteCubit
                      .addNote(
                          noteModel: NoteModel(
                              date: DateFormat("dd-MM-yyyy").format(DateTime.now()),
                              title: widget.noteCubit.titleController.text,
                              subTitle: widget.noteCubit.subTitleController.text),
                          id: patientModel!.id.toString())
                      .then((value) {
                    widget.noteCubit.titleController.clear();
                    widget.noteCubit.subTitleController.clear();
                    Navigator.of(context).pop();
                  }).catchError((onError) {
                    isLoading.value = false;
                  });
                },
              ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
