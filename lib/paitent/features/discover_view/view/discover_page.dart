import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwell/paitent/features/discover_view/manger/cubit/discover_cubit.dart';
import 'package:mindwell/shared_features/appbar/appbar.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:shimmer/shimmer.dart';

import '../Widget/book_gridview.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverCubit()..getBooks(context),
      child: BlocConsumer<DiscoverCubit, DiscoverState>(
        listener: (context, state) {},
        builder: (context, state) {
          DiscoverCubit cubit = DiscoverCubit.get(context);
          if (state is Loading) {
            return Scaffold(

              appBar: customAppBar(getLang(context, "Discover")),
              body: Shimmer.fromColors(
                  baseColor:  Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,child:
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child:  GridView.builder(
                      itemCount: 8,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //childAspectRatio: 1/1.25,
                        mainAxisSpacing: 50,
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 30, left: 8, right: 8,bottom: 10) ,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration:  BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        );
                      },

                    ),
                  )

              )
            );
          }
          return Scaffold(

            appBar: customAppBar(getLang(context, "Discover")),
            body: bookGridView(cubit.book, context),
          );
        },
      ),
    );
  }
}
