import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imagePath;
  final double radius;

  const Avatar({super.key, required this.imagePath, required this.radius});

  @override
  Widget build(BuildContext context) {
    // return CircleAvatar(
    //   //backgroundColor: Colors.black,
    //   backgroundImage: imagePath !=null
    //       ? AssetImage(imagePath,)as ImageProvider<Object>?
    //       :  AssetImage('assets/download_image.gif'),
    //   radius: radius,
    // );
    return CircleAvatar(
      backgroundColor: Colors.black,
      backgroundImage: NetworkImage(imagePath),
      radius: radius,
    );
  }
}