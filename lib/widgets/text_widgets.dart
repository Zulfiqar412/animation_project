// ignore_for_file: must_be_immutable

import 'package:animation_project/utils/my_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appcolors.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.textColor = AppColors.blackColor,
    this.isUnderline = false,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.textOverflow = TextOverflow.clip,
    this.litterSpacing,
    this.wordSpacing,
    this.lineHeight,
  });
  String text;
  double? fontSize;
  Color? textColor;
  FontWeight? fontWeight;
  bool? isUnderline;
  TextAlign? textAlign;
  int? maxLines;
  TextOverflow? textOverflow;
  double? litterSpacing;
  double? wordSpacing;
  double? lineHeight;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: GoogleFonts.quicksand(
        height: lineHeight,
        wordSpacing: wordSpacing,
        letterSpacing: litterSpacing,
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            decoration: isUnderline! ? TextDecoration.underline : null,
            decorationColor: Colors.transparent),
      ),
    );
  }
}
