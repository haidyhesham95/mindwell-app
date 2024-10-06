import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/note/manager/note_cubit.dart';

import '../../../../shared_utils/styles/colors.dart';
import 'add_note.dart';

class FloatingButtonNote extends StatelessWidget {
  const FloatingButtonNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.h,
      ),
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsAsset.kBrown,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            context: context,
            builder: (bottomSheetContext) {
              return AddNote(BlocProvider.of<NoteCubit>(context));
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
