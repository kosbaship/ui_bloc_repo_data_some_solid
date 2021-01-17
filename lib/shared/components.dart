import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:soild_restful/shared/common_colors.dart';

Widget loadingDots() => SpinKitFadingFour(
      color: kWritingColor,
      size: 50.0,
    );

Widget defaultText({
  @required String title,
  String fontFamily = 'SourceSansPro',
  double fontSize = 20.0,
  Color color = kColorShade900,
  FontWeight fontWeight = FontWeight.bold,
}) =>
    Text(
      title,
      style: TextStyle(
          fontSize: fontSize,
          letterSpacing: 1.5,
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight),
    );
