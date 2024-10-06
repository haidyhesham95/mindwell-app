import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared_features/feed/widgets/appbar.dart';
import '../../../../shared_utils/components/app_local.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../manager/my_posts_cubit.dart';
import '../widgets/post_list.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      MyPostsCubit()
        ..getDoctorPost(),
      child: BlocConsumer<MyPostsCubit, MyPostsState>(
        listener: (context, state) {
          // TODO: Implement listener if needed.
        },
        builder: (context, state) {

          MyPostsCubit cubit = MyPostsCubit.get(context);
          if (cubit.doctorPosts.isEmpty) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/no post.gif'),
                    Text(getLang(context, "There's nothing in here"),
                      style: Styles.textStyle25,),
                  ],
                ),
              ),
            );
          }

          else {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: appBar(),
                body: postList(cubit),
              );
            }
        },
      ),
    );
  }
}



