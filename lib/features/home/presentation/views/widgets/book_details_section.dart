import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'details_book_arguments.dart';
import 'featured_list_view_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as DetailsBookArguments;
    return Column(
      children: [
        const SizedBox(height: 15),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: FeaturedListViewItem(
              image: data.image,
            )),
        const SizedBox(height: 40),
        Text(data.titleBook, style: Styles.textStyle30),
        const SizedBox(height: 5),
        Opacity(
            opacity: 0.7, //same xd design
            child: Text(data.author,
                style: Styles.textStyle18
                    .copyWith(color: const Color(0xff707070)))),
        const SizedBox(height: 14),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: data.rating ?? 4.5,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
