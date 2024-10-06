class PatientModel {
  String? name;
  String? email;
  String? phone;
  String? id;
  String? image;
  String? token;

  PatientModel(
      {required this.email,
      required this.name,
      required this.phone,
      required this.id,
        required this.image,
        required this.token,
      });

  PatientModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'phone': phone,
        'id': id,
        'image': image,
        'token': token,
      };
}
