import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindwell/paitent/features/discover_view/model/book_model.dart';
import 'package:mindwell/paitent/features/discover_view/Widget/divider_widget.dart';
import 'package:mindwell/paitent/features/discover_view/Widget/download_button.dart';
import 'package:mindwell/paitent/features/discover_view/Widget/row_text.dart';
import 'package:mindwell/paitent/features/discover_view/Widget/show_text_widget.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../manger/cubit/discover_cubit.dart';

class DiscoverDetails extends StatelessWidget {
  const DiscoverDetails({super.key, required this.bookModel, required this.tag});
  final BookModel bookModel;
  final  Object tag;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverCubit(),
      child: BlocConsumer<DiscoverCubit, DiscoverState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          DiscoverCubit cubit = DiscoverCubit.get(context);
          return Scaffold(
            backgroundColor: ColorsAsset.kWhite,
            body: CustomScrollView(
              slivers: [
              SliverAppBar(
              expandedHeight: 600,
              pinned: true,
              stretch: true,
              backgroundColor: ColorsAsset.kWhite,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // title: Text(
                //   bookModel.name!,
                //   style: Styles.textStyle20.copyWith(color:Colors.black),
                // ),
                background: Hero(
                  tag:tag ,
                  child: Image.network(
                    bookModel.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowText(text: getLang(context, 'Name : '), data: bookModel.name!,),
                            const SizedBox(height: 15,),
                            RowText(
                              text:getLang(context,'Author : '), data: bookModel.author!,),
                            const SizedBox(height: 20,),
                            const DividerWidget(),
                            const SizedBox(height: 10,),
                            Text(
                              getLang(context, 'Description : '),
                              style: Styles.textStyle25
                                  .copyWith(color: Colors.black),
                            ),
                            ShowTextWidget(data: bookModel.description!,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      DownloadButton(
                        onPressed: () {
                          // cubit.downloadFile(bookModel.download!, bookModel.name!);
                          Uri uri = Uri.parse(bookModel.download ?? "");
                          cubit.launchInBrowser(uri);
                        },),
                      const SizedBox(
                        height: 500,
                      )
                    ],
                  ),
                ),


    ],
    ),
    );
    },
    ),
    );
    }
    }





  // Widget buildSliverAppBar() {
  //   return SliverAppBar(
  //     expandedHeight: 600,
  //     pinned: true,
  //     stretch: true,
  //     backgroundColor: ColorsAsset.kWhite,
  //     flexibleSpace: FlexibleSpaceBar(
  //       centerTitle: true,
  //       title: Text(
  //         bookModel.name!,
  //         style: Styles.textStyle20,
  //       ),
  //       background: Image.network(
  //         bookModel.image!,
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }
  //
  //
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => DiscoverCubit(),
  //     child: BlocConsumer<DiscoverCubit, DiscoverState>(
  //       listener: (context, state) {},
  //       builder: (context, state) {
  //         DiscoverCubit cubit = DiscoverCubit.get(context);
  //         return Scaffold(
  //             backgroundColor: ColorsAsset.kWhite,
  //             body: CustomScrollView(
  //               slivers: [
  //                 buildSliverAppBar(),
  //                 SliverList(
  //                   delegate: SliverChildListDelegate(
  //                     [
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
  //                         padding: EdgeInsets.all(8),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             RowText(text: 'Name : ', data: bookModel.name!,),
  //                             const SizedBox(height: 15,),
  //                             RowText(
  //                               text: 'Author : ', data: bookModel.author!,),
  //                             const SizedBox(height: 20,),
  //                             const DividerWidget(),
  //                             const SizedBox(height: 10,),
  //                             Text(
  //                               'Description : ',
  //                               style: Styles.textStyle25
  //                                   .copyWith(color: Colors.black),
  //                             ),
  //                             ShowTextWidget(data: bookModel.description!,)
  //                           ],
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 50.h,
  //                       ),
  //                       DownloadButton(
  //                         onPressed: () {
  //                           // cubit.downloadFile(bookModel.download!, bookModel.name!);
  //                           Uri uri = Uri.parse(bookModel.download ?? "");
  //                           cubit.launchInBrowser(uri);
  //                         },),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 500,
  //                 )
  //               ],
  //             )
  //         );
  //       },
  //     ),
  //   );
  // }
 // }
