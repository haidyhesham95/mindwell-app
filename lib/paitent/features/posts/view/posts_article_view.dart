import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/posts/view/articles/view/articles_screen.dart';
import 'package:mindwell/shared_features/feed/view/feed_screen.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

class PostsAndArticleView extends StatelessWidget {
  const PostsAndArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(top:40),
        child: Scaffold(
          backgroundColor: Colors.white,
            appBar:  TabBar(
              indicatorColor:ColorsAsset.kBrown,
              dividerColor: Colors.transparent,
              unselectedLabelColor: ColorsAsset.kBrown.withOpacity(0.4),
              labelColor: ColorsAsset.kBrown,
              tabs:  [
                Tab(
                  text: getLang(context, "Posts")
                ),
                Tab(
                  text: getLang(context, "Articles")
                ),
              ],
            ),
          body:  const TabBarView(
            children: [
              PostsScreen(),
              ArticlesScreen(),

            ],
          ),


        ),
      ),
    );
  }
}
