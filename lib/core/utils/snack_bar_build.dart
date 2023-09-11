import 'package:flutter/material.dart';

SnackBar buildSnackBar(String errorMsg) {
  return SnackBar(
    backgroundColor: Colors.yellowAccent,
    content: Text(
      'Warning!! $errorMsg',
      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
    ),
    duration: const Duration(seconds: 2),
  );
}
