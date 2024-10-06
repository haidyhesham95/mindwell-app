import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/note/model/note_model.dart';
import 'package:mindwell/shared_utils/utils/constant.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  List<NoteModel> notes = [];
  List<String> noteId = [];

  String? title;
  String? subTitle;

  void onChangeTitle(String? value) {
    title = value;
  }

  void onChangeSubTitle(String? value) {
    subTitle = value;
  }

  Future<void> addNote({
    required NoteModel noteModel,
    required String id,
  }) async {
    emit(AddNoteLoading());
    DocumentReference docRef = FirebaseFirestore.instance.collection("patients")
        .doc(id)
        .collection("notes")
        .doc();
    await docRef.set(noteModel.toMap(id: docRef.id));

    await getNote();
    emit(AddNoteSuccess());
  }

  Future<void> getNote() async {
    emit(LoadingNote());
    final snapshot =
    await FirebaseFirestore.instance.collection('patients').doc(
        patientModel!.id).collection('notes').get();
    notes = [];
    for (var element in snapshot.docs) {
      final noteData = await element.reference.get();
      notes.add(NoteModel.fromJson(noteData.data()));
    }

    emit(GetNote());
    print(notes);
  }

  Future<void> deleteNote({
    required String patientId,
    required String noteId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("patients")
          .doc(patientId)
          .collection("notes")
          .doc(noteId)
          .delete()
          .then((value) {
        getNote();
      });

      emit(DeleteNote());

      print('Note deleted successfully!');
    } catch (e) {
      print('Error deleting note: $e');
    }
  }


 //   String ?id;
 //  String? patientId;
 //
  Future<void> editNote()
 async {
    await     FirebaseFirestore.instance.collection('patients').doc(patientModel!.id) .collection("notes")
            .doc(noteModel!.id).update({
        'title': title ,
        'subTitle': subTitle ,

      }) .then((value) => print("Note Edit"))
            .catchError((error) => print("Failed to edit note: $error"));
   }




}
