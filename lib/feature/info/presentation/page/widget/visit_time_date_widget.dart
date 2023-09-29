import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class VisitTimeDateWidget extends StatelessWidget {
  final String time;

  const VisitTimeDateWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Время посещения", style: AppTextStyle.radialChart),
        Text(
          '${DateTime.tryParse(time)?.day}.${DateTime.tryParse(time)?.month}.${DateTime.tryParse(time)?.year}',
          style: AppTextStyle.timeDateText,
        ),
      ],
    );
  }
}
