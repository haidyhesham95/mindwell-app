import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/posts/view/posts_article_view.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../../features/chatbot/chatbot_view.dart';
import '../../features/discover_view/view/discover_page.dart';
import '../../features/homeview/view/homeview.dart';
import '../../features/profile/view/profile_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar:
      Container(
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
          itemCount: 5,
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
                    right: size.width * .0300,
                    left: size.width * .0300,
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
                  color: index == _currentIndex ? Colors.brown.withOpacity(0.5) : Colors.black38,
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
    'assets/icons8-home-64.png',
    'assets/icons8-bookmark-50.png',
    'assets/icons8-code-post-100.png',
    'assets/icons8-chatbot-50.png',
    'assets/icons8-user-menu-male-50.png',
  ];

  final List<Widget> pages = [
    const HomeView(),
    const DiscoverPage(),
    const PostsAndArticleView(),
    const ChatBotPage(),
    const ProfilePage(),
  ];
}
