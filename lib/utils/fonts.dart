import 'package:flutter/cupertino.dart';
import 'package:formulas_cms/utils/colors.dart';

class AppFonts {
  static TextStyle baseFont = TextStyle(color: AppColors.primaryTextColor);

  static TextStyle h1 =
      baseFont.copyWith(fontSize: 32, fontWeight: FontWeight.bold);

  static TextStyle h2 =
      baseFont.copyWith(fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle h3 = baseFont.copyWith(fontSize: 18);

  static TextStyle h4 =
      baseFont.copyWith(fontSize: 13.28);

  static TextStyle h5 =
      baseFont.copyWith(fontSize: 10.72);
}
