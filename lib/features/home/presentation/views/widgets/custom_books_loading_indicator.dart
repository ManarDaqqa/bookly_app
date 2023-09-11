

import 'package:flutter/material.dart';

class CustomBooksLoadingIndicator extends StatelessWidget {
  const CustomBooksLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
