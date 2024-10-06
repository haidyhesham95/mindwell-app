class ChatUserModel {
  String? name;
  String? image;
  String? id;
  String? date;
  bool? unread;
  String? lastMessage;
  String? token;

  ChatUserModel({
    required this.image,
    required this.name,
    this.lastMessage,
    this.date,
    required this.id,
    this.unread,
  });

  ChatUserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    image = json['image'];
    lastMessage = json['lastMessage'];
    id = json['id'];
    date = json['date'];
    unread = json['unread'];
    token = json['token'];
  }

  Map<String, dynamic> toMap({required id}) => {
        'id': id,
        'name': name,
        'image': image,
        'lastMessage': lastMessage,
        'date': date,
        'unread': unread,
      };
}
