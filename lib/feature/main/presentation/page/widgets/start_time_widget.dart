import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class StartTimeWidget extends StatelessWidget {
  final String startTime;

  const StartTimeWidget({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Начало работы:",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(height: 20),
        Center(
          child: Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: LightColorTheme.startTimeBackGround,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: LightColorTheme.buttonBackgroundColor,
              ),
            ),
            child: Text(
              '${DateTime.tryParse(startTime)?.hour ?? '--'} : ${DateTime.tryParse(startTime)?.minute ?? '--'}',
              style: const TextStyle(
                color: LightColorTheme.buttonBackgroundColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
