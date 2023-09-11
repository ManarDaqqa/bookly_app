import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BestSellerItem(
              image: books[index].image ?? '',
              titleBook: books[index].title,
              rating: books[index].rating ?? 4.5,
              author: books[index].authorName ?? 'anonymous',
              price: books[index].price ?? 0.5,
            ),
          );
        });
  }
}
