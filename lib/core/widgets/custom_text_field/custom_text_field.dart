import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? isVisible;
  final String hintText;
  final Widget? suffix;
  final bool? isCorrect;
  final Function(String onChange)? onTextChange;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isVisible = false,
    this.suffix,
    this.onTextChange, this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTextChange,
      obscureText: isVisible ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: (isCorrect ?? true) ? Colors.white : Colors.red
            )
        ),
      ),
    );
  }
}
