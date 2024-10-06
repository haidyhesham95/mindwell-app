class QuestionModel {
  String? q1;
  String? q2;
  String? q3;
  String? q4;
  String? q5;
  String? q6;
  String? id;

  QuestionModel(
      {required this.q2,
        required this.q1,
        required this.q3,
        required this.q4,
        required this.q5,
        required this.q6,
        required this.id,
      });

  QuestionModel.fromJson(Map<String, dynamic>? json) {
    q1 = json?['q1'];
    q2 = json?['q2'];
    q3 = json?['q3'];
    q4 = json?['q4'];
    q5 = json?['q5'];
    q6 = json?['q6'];
    id = json?['id'];
  }

  Map<String, dynamic> toMap() => {
    'q1': q1,
    'q2': q2,
    'q3': q3,
    'q4': q4,
    'q5': q5,
    'q6': q6,
    'id': id,
  };
}
