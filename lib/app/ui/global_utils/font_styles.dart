import 'package:flutter/material.dart';

abstract class FontStyles {
  // static final textTheme = GoogleFonts.nunitoTextTheme();

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const regular = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const normal = TextStyle(
    fontWeight: FontWeight.w300,
  );
}
