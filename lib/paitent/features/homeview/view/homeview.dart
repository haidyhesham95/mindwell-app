import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared_utils/utils/constant.dart';
import '../manager/cubit/home_cubit.dart';
import '../widgets/dialog_image.dart';
import '../widgets/home_appbar.dart';
import '../widgets/illness_list.dart';
import '../widgets/no_internet_dialog.dart';
import '../widgets/serach_textfield.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getdata(context),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            String url = cubit.changeImage();
            if (state is Loading) {
              return Scaffold(
                appBar: homeAppBar(context),
                body: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              searchTextField(context, cubit),
                              const SizedBox(height: 15),
                              Text(
                                  getLang(context,
                                      "Discover the most common diseases"),
                                  style: GoogleFonts.dosis()),
                              const SizedBox(height: 15),
                            ],
                          )),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.grey.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  tileColor: ColorsAsset.kWhite,
                                  title: Container(
                                    width: 200.0,
                                    height: 16.0,
                                    color: Colors.grey[50],
                                  ),
                                  trailing: Container(
                                    width: 20.0,
                                    height: 12.0,
                                    color: Colors.grey[50],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return StreamBuilder<ConnectivityResult>(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, snapshot) {
                  return Scaffold(
                    appBar: homeAppBar(context),
                    body: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 20),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              searchTextField(context, cubit),
                              const SizedBox(height: 15),
                              Text(
                                  getLang(
                                      context, "Discover the most common diseases"
                                  ),
                                  style: GoogleFonts.dosis()),
                              const SizedBox(height: 15),
                              illnessList(context, cubit),
                            ],
                          ),
                          if (Constants.isVisible) imageContainer(cubit, url),
                          if (snapshot.data == ConnectivityResult.none)
                            noInternetContainer(),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
