import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../doctor/features/add_view_screen/manager/add_article_cubit.dart';
import '../../../../../../shared_utils/styles/colors.dart';
import '../widget/article_item.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddArticleCubit()..getArticle(context),
        child: BlocBuilder<AddArticleCubit, AddArticleState>(builder: (context, state) {
          AddArticleCubit cubit = AddArticleCubit.get(context);
          if (state is Loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorsAsset.kBrown,
            ));
          } else {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 30.h);
              },
              padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 18.w),
              itemCount: cubit.articles.length,
              itemBuilder: (context, int index) {
                return ArticleItem(
                  name: cubit.articles[index].name.toString(),
                  description: cubit.articles[index].description.toString(),
                  image: cubit.articles[index].image.toString(),
                );
              },
            );
          }
        }));
  }
}
