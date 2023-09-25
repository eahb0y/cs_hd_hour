import 'package:flutter/material.dart';

class StartTimeWidget extends StatelessWidget {
  final String startTime;
  const StartTimeWidget({super.key, required this.startTime});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 16),
      child: Column(
        children: [
          const Text("Начатое время",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 10,),
          Text(
            '${DateTime.tryParse(startTime)?.hour ?? '--'} : ${DateTime.tryParse(startTime)?.minute ?? '--'}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
