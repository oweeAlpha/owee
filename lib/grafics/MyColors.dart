import 'package:flutter/material.dart';

class MyColors extends ColorScheme {
  static const Color topBar = MyColors.lightTurquise;
  static const Color bigText = MyColors.greenDark;
  static const Color smallText = MyColors.greenDarker;
  static const Color icons = MyColors.bigText;
  static const Color textFieldOutline = MyColors.lightGrey;
  static const Color textFieldText = MyColors.Grey;
  static const Color darkGreenButton = MyColors.greenDark;
  static const Color darkGreenButtonText = MyColors.lightTurquise;
  static const Color cardViewBackground = MyColors.lightTurquise;

  static const Color lightTurquise = Color(0xFFD4EDEF);
  static const Color greenDark = Color(0xFF25868E);
  static const Color greenDarker = Color(0xFF0C5760);
  static const Color lightGrey = Color(0xFFC5C5C5);
  static const Color Grey = Color(0xFF909090);



  static const Color green = Color(0xFF6FCFBD);


  static const Color greenVariant = Color(0xFF478B7C);
  static const Color blue = Color(0xFFB5EAEA);
  static const Color blueVariant = Color(0xFF7FA8A8);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color errorColor = Color(0xFFC5032B);

  //add custom colors here (no need to add to MyColors())
  static const Color gradientDark = Color(0xFF01AA8B);
  static const Color gradientLight = Color(0xFF6FCFBD);

  static const Color font_black = Color(0xFF292A2E);

  MyColors()
      : super(
    primary: green,
    primaryVariant: greenVariant,
    secondary: blue,
    secondaryVariant: blueVariant,
    surface: white,
    background: white,
    error: errorColor,
    onPrimary: white,
    onSecondary: black,
    onSurface: black,
    onBackground: black,
    onError: white,
    brightness: Brightness.light,
  );
}