
import 'package:bookly/core/widgets/custom_fadeing_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_books_loading_indicator.dart';
import 'package:flutter/material.dart';


class FeaturedBookListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBookListViewLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: CustomBooksLoadingIndicator(),
              );
            }),
      ),
    );
  }
}
