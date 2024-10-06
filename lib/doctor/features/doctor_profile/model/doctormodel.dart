class DoctorModel {
  String? name;
  String? email;
  String ? phone;
  String ? id;
  String? image;
  String? bio;
  String? specialty;
  String? token;




  DoctorModel({required this.email, required this.name,required this.phone,required this.id, required this.image,required this.bio,required this.specialty,required this.token});

  DoctorModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    bio = json['bio'];
    specialty = json['specialty'];
    token = json['token'];
  }

  Map<String, dynamic> toMap({required id}) => {
    'name': name,
    'email': email,
    'phone': phone,
    'id': id,
    'image': image,
    'bio':bio,
    'specialty':specialty,
    'token':token
  };
}
