import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String buttonText;
  final Function()? onPressed;
  final Color borderColor;
  final Color? textColor;
  final bool? isLoading;

  const CustomButton(
      {super.key,
      this.color,
      required this.buttonText,
      required this.onPressed,
      required this.borderColor,
      this.textColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 51),
          backgroundColor: color ?? Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: borderColor,
              ))),
      child: (isLoading ?? false)
          ? CircularProgressIndicator(
              backgroundColor: Colors.purple.shade300,
              color: Colors.purple.shade100,
            )
          : Text(
              buttonText,
              style: AppTextStyle.buttonText.copyWith(color: textColor),
            ),
    );
  }
}
