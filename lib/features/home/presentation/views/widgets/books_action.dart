import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'details_book_arguments.dart';


class BooksAction extends StatelessWidget {
  const BooksAction({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as DetailsBookArguments;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          backgroundColor: Colors.white,
          textButton: '${data.price} €',
          textStyle: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold,color: Colors.black),

          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        CustomButton(
          backgroundColor: const Color(0xffEF8262),
          textButton: 'Free preview',
          textStyle: Styles.textStyle16
              .copyWith(fontWeight: FontWeight.bold, fontFamily: kGilroy,color: Colors.white),

          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        )
      ],
    );
  }
}
