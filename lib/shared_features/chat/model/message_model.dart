class MessageModel {
  String? date;
  String? receverId;
  String? id;
  String? senderId;
  String? type;
  String? text;
  String? sender;

  MessageModel(
      {required this.receverId,
      required this.date,
      required this.senderId,
      this.id});

  MessageModel.fromJson(Map<String, dynamic>? json) {
    date = json!['date'];
    receverId = json['receverId'];

    id = json['id'];
    senderId = json['senderId'];
    type = json['type'];
    text = json['text'];
    sender = json['sender'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'date': date,
        'receverId': receverId,
        'senderId': senderId,
        'type': type,
        'text': text,
        'sender': sender,
      };
}
