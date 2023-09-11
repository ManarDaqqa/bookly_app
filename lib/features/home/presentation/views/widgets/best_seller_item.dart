import 'dart:core';
import 'package:bookly/core/utils/app_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'details_book_arguments.dart';



class BestSellerItem extends StatelessWidget {
  const BestSellerItem({Key? key, required this.image, required this.titleBook, required this.author, required this.price, required this.rating}) : super(key: key);

  final String image;
  final String titleBook;
  final String author;
  final num price;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.kBookDetailsView,arguments:DetailsBookArguments(titleBook: titleBook, rating: rating,price: price,image: image,author: author));
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      titleBook,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(fontFamily: kGTSectraFine),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    author,
                    style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '$price',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(rating: rating,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}