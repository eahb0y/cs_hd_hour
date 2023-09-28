import 'package:flutter/material.dart';

class StartTimeWidget extends StatelessWidget {
  final String startTime;

  const StartTimeWidget({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Начатое время",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '${DateTime.tryParse(startTime)?.hour ?? '--'} : ${DateTime.tryParse(startTime)?.minute ?? '--'}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
