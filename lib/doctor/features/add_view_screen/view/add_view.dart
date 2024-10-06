import 'package:flutter/material.dart';

import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import 'add_article_screen.dart';
import 'add_post_screen.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

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
                  text: getLang(context, "Add Post")
              ),
              Tab(
                  text: getLang(context, "Add Article")
              ),
            ],
          ),
          body:  const TabBarView(
            children: [
              AddPostScreen(),
              AddArticleScreen(),

            ],
          ),


        ),
      ),
    );
  }
}
