class NoteModel {
  String? subTitle;
  String? date;
  String ? title;
  String ? id;

  NoteModel({required this.date,  this.id,required this.title , required this.subTitle});

  NoteModel.fromJson(Map<String, dynamic>? json) {
    subTitle = json!['subTitle'];
    date = json['date'];
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toMap({required id}) => {
    "title": title,
    "subTitle": subTitle,
    'date': date,
    'id': id,
  };
}