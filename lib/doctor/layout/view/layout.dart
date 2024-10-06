import 'package:flutter/material.dart';
import 'package:mindwell/shared_features/auth/manger/cubit/auth_cubit.dart';
import 'package:mindwell/shared_features/chat/view/chats_view.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import '../../../paitent/features/posts/view/posts_article_view.dart';
import '../../../shared_utils/utils/connectivity_service.dart';
import '../../features/add_view_screen/view/add_view.dart';
import '../../features/doctor_profile/view/doctor_profile_view.dart';

class DoctorNavbar extends StatefulWidget {
  const DoctorNavbar({Key? key}) : super(key: key);

  @override
  State<DoctorNavbar> createState() => _NavBarState();
}

class _NavBarState extends State<DoctorNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
   // const PostsScreen(),
    const PostsAndArticleView(),
    const AddView(),
    const ChatList(),
    const DoctorProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    ConnectivityService.connectivityCheck();
    AuthCubit().updateTokens();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
         padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1450),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == _currentIndex ? 0 : size.width * .029,
                    right: size.width * .0540,
                    left: size.width * .0540,
                  ),
                  width: size.width * .110,
                  height: index == _currentIndex ? size.width * .013 : 0,
                  decoration: const BoxDecoration(
                    color: ColorsAsset.kBrown,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Image.asset(
                  listOfIcons[index],
                  height: size.width * .076,
                  color: index == _currentIndex
                      ? Colors.brown.withOpacity(0.5)
                      : Colors.black38,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> listOfIcons = [
    "assets/icons8-code-post-100.png",
    "assets/icons8-add-new-50 (1).png",
    "assets/icons8-chat-64 (1).png",
    'assets/icons8-user-menu-male-50.png',
  ];


    // return Scaffold(
    //   body: _pages[_currentIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     unselectedLabelStyle: const TextStyle(color: Colors.grey),
    //     selectedLabelStyle: const TextStyle(color: Colors.grey),
    //     fixedColor: ColorsAsset.kBrown,
    //     currentIndex: _currentIndex,
    //     onTap: (int index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Image.asset(
    //           "assets/icons8-code-post-100.png",
    //           height: 32,
    //           color: Colors.grey,
    //         ),
    //         label: getLang(context, 'Feed'),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Image.asset(
    //           "assets/icons8-add-new-50 (1).png",
    //           height: 25,
    //           color: Colors.grey,
    //         ),
    //         label: getLang(context, 'Add')
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Image.asset(
    //           "assets/icons8-chat-64 (1).png",
    //           height: 28,
    //           color: Colors.grey,
    //         ),
    //         label: getLang(context, 'Chat')
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Image.asset(
    //           "assets/icons8-user-menu-male-50.png",
    //           height: 30,
    //           color: Colors.grey,
    //         ),
    //         label: getLang(context, 'Profile')
    //       ),
    //     ],
    //   ),
    // );
 // }
}
