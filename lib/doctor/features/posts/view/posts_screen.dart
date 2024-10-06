import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import '../../../../shared_features/feed/widgets/appbar.dart';
import '../../../../shared_features/feed/widgets/post_listview.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../add_view_screen/manager/addpost_cubit.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) => AddPostCubit()..getPost(),
      child: BlocConsumer<AddPostCubit, AddpostState>(
        listener: (context, state) {
          // TODO: Implement listener
        },
        builder: (context, state) {
          AddPostCubit cubit = AddPostCubit.get(context);
          if (cubit.posts.isEmpty) {
            return  Scaffold(
             body : Center(
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/no post.gif'),
                    Text(getLang(context, "There's nothing in here"),style: Styles.textStyle25,),
                  ],
                ),
             ),
            );
          }else {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: appBar(),
              body: postListView(cubit),
            );
          }
        },
      ),
    );

  }
}

