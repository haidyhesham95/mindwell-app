import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import '../../../doctor/features/add_view_screen/manager/addpost_cubit.dart';
import '../widgets/post_listview.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key,});

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
        return cubit.posts.isEmpty?
        Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/no post.gif'),
                  Text(getLang(context, "There's nothing in here"), style: Styles.textStyle25),
                ],
              ): postListView(cubit);

          // if (cubit.posts.isEmpty) {
          //   return Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Image.asset('assets/no post.gif'),
          //       Text("There's nothing in here", style: Styles.textStyle25),
          //     ],
          //   );
          // } else if (state is Loading) {
          //   return const Center(
          //     child: CircularProgressIndicator(
          //       color: ColorsAsset.kBrown,
          //     ),
          //   );
          // } else {
          //   return postListView(cubit);
          // }
        },
      ),
    );


  }
}

