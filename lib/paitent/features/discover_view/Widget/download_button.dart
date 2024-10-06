import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key, this.onPressed});
   final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 55,
     //width: 80.w > 120 ? 80.w : 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 35,
            offset: const Offset(4, 7),
          ),
        ]
    ),
      child: MaterialButton(
        onPressed: onPressed,
        color: ColorsAsset.kBrown,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              Text(
               getLang(context, 'Download'),
                style: Styles.textStyle10sp,
              ),
              const Icon(
                IconlyLight.download,
                size: 25,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}


class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

@override
_MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
with TickerProviderStateMixin {
bool isTapped = false;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.blue,
body: Center(
child: InkWell(
highlightColor: Colors.transparent,
splashColor: Colors.transparent,
onHighlightChanged: (value) {
setState(() {
isTapped = value;
});
},
onTap: () {},
child: AnimatedContainer(
duration: const Duration(milliseconds: 300),
curve: Curves.fastLinearToSlowEaseIn,
height: isTapped ? 55 : 60,
width: isTapped ? 150 : 160,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: const BorderRadius.all(
Radius.circular(30),
),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.3),
blurRadius: 30,
offset: const Offset(3, 7),
),
],
),
child: Center(
child: Text(
'TAP HERE',
style: TextStyle(
color: Colors.black.withOpacity(0.7),
fontWeight: FontWeight.w500,
fontSize: 19,
),
),
),
),
),
),
);
}
}