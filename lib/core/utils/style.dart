import 'package:flutter/cupertino.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  Styles._();
  static TextStyle textStyle12 = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.blueDark);

  static TextStyle textStyle14 = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.blueDark);

  static TextStyle textStyle11 = const TextStyle(
      fontSize: 11,
      decoration: TextDecoration.lineThrough,
      textBaseline: TextBaseline.alphabetic,
      fontWeight: FontWeight.w400,
      color: AppColors.blueDark);
}
