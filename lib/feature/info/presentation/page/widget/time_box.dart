import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  final String status;
  final int num;

  const TimeBox({
    super.key,
    required this.status,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            status,
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$num минут',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
