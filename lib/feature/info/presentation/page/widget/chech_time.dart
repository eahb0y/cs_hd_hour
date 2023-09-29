import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class CheckTime extends StatelessWidget {
  final String title;
  final String time;

  const CheckTime({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.timeBoxLabel,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '${DateTime.tryParse(time)?.hour ?? '--'}:${DateTime.tryParse(time)?.minute ?? '--'}',
          style: AppTextStyle.timeText,
        ),
      ],
    );
  }
}
