class PostModel {
  String? content;
  String? date;
  String ? name;
  String ? id;
  String ?docImage;

  PostModel({required this.date, required this.content,required this.name,required this.id,this.docImage});

  PostModel.fromJson(Map<String, dynamic>? json) {
    content = json!['content'];
    date = json['date'];
    name = json['name'];
    id = json['id'];
    docImage = json['docImage'];
  }

  Map<String, dynamic> toMap({required id}) => {
    'content': content,
    'date': date,
    'name': name,
    'id': id,
    'docImage': docImage,
  };
}