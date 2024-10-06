
import 'package:flutter/cupertino.dart';

class SliderRight extends PageRouteBuilder{
  final  page;
  SliderRight({this.page,}):super(
      pageBuilder:(context,animation,animationtwo)=>page ,
      transitionsBuilder:(context,animation,animationtwo,child)
      {
        var  begin = const Offset(1.0 , 0.0);
        var end =Offset.zero;
        var tween = Tween(begin: begin,end: end);
        var offsetAnimation =animation.drive(tween);
        return SlideTransition(position: offsetAnimation,child: child,);
      }
  );

}