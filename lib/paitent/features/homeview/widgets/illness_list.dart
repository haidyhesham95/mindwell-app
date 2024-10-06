import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';

import '../manager/cubit/home_cubit.dart';
import '../view/titleview.dart';

Widget illnessList(BuildContext context, HomeCubit cubit) {
  return Expanded(
    child: ListView.builder(
      itemCount: cubit.isSearching ? cubit.searchList.length : cubit.illness.length,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => IllnessDescribtion(
                    illnessModel: cubit.isSearching
                        ? cubit.searchList[index]
                        : cubit.illness[index],
                  ),
                ));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: ColorsAsset.kWhite,
              title: Text(
                "${cubit.isSearching ? cubit.searchList[index].name : cubit.illness[index].name}",
                style: GoogleFonts.dosis(),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorsAsset.kBrown,
              ),
            ),
          ),
        );
      },
    ),
  );
}