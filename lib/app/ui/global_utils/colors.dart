import 'package:flutter/material.dart';

const primaryColor = Color(0xff170c66);
const grayColor = Color(0xfffdfdfd);
const blueColor = Color(0xff170c66);
const blueSecColor = Color(0xff0e064a);
const redColor = Color(0xffe02228);
const redSecColor = Color(0xfff22209);

class Palette {
  static const MaterialColor primaryPalette = MaterialColor(
    0xff170c66, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff8b86b3), //10%
      100: Color(0xff746da3), //20%
      200: Color(0xff5d5594), //30%
      300: Color(0xff453d85), //40%
      400: Color(0xff2e2475), //50%
      500: Color(0xff170c66), //60%
      600: Color(0xff150b5c), //70%
      700: Color(0xff120a52), //80%
      800: Color(0xff100847), //90%
      900: Color(0xff0e073d), //100%
    },
  );
}
