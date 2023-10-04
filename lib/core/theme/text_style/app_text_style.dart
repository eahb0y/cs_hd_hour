import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static  const buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static  const helloText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static  const appBarText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: LightColorTheme.white
  );
  static  const radialChart = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );
  static  const timeBoxLabel = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
  );
  static  const timeBoxTime = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static  const timeText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static  const timeDateText = TextStyle(
    color: LightColorTheme.timeDate,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static  const dialogButtonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const timerButton = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: LightColorTheme.buttonBackgroundColor,
  );
}
