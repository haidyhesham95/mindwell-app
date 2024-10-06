class ArticlesModel{

  String? name;
  String? description;
  String? image;
  String? id;

  ArticlesModel({required this.name, required this.description , required this.image,required this.id});


  ArticlesModel.fromJson(Map<String, dynamic>? json) {
    image = json!['image'];
    name = json['name'];
    description = json['description'];
    id = json['id'];



  }

  Map<String, dynamic> toMap({required id}) => {
    'id': id,
    'name': name,
    'description':description,
    'image':image

  };
}