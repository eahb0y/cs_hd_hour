import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  final String status;
  final int num;
  final Color labelColor;
  final Color backGroundColor;
  final Color timeColor;

  const TimeBox({
    super.key,
    required this.status,
    required this.num,
    required this.labelColor,
    required this.backGroundColor,
    required this.timeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.only(left: 16, bottom: 14, top: 14, right: 60),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: AppTextStyle.timeBoxLabel.copyWith(color: labelColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$num минут',
            style: AppTextStyle.timeBoxTime.copyWith(color: timeColor),
          ),
        ],
      ),
    );
  }
}
