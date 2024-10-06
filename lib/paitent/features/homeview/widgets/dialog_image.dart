import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/homeview/manager/cubit/home_cubit.dart';

Widget imageContainer(HomeCubit cubit, String url) {
  return Center(
    child: Container(
      width: 300,
      height: 350,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                cubit.cancelVisibility();
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
          Image.asset(url),
        ],
      ),
    ),
  );
}
