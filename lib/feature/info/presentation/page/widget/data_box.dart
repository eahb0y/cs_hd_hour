import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  final String data;

  const DataBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Ink(
        height: 40,
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          data,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
