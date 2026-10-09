import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';

class FormStyles {
  static const InputDecoration textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Color.fromARGB(10, 0, 0, 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Radii.xl)),
      borderSide: BorderSide.none,
    ),
  );
}
