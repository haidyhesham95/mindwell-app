import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/discover_view/model/book_model.dart';

import '../view/Discover_Details.dart';
import 'gridview_item.dart';

Widget bookGridView(List<BookModel> books, BuildContext context) {
  return
     GridView.builder(
      itemCount: books.length,
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
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverDetails(
                  bookModel: books[index],
                  tag: books[index],
                ),
              ),
            );
          },
          child: Hero(
            tag: books[index],
              child: gridviewItem(books[index])),
        );
      },

  );
}





