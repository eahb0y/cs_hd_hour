import 'dart:async';

import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final DateTime? statusUpdateTime;

  const TimerWidget({
    super.key,
    this.statusUpdateTime,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? timer;
  int timePassed = 0;
  Color? textColor;
  String timerText = "";

  @override
  void initState() {
    newOrderTimer();
    timerCount();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TimerWidget oldWidget) {
    newOrderTimer();
    super.didUpdateWidget(oldWidget);
  }

  void timerCount() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        newOrderTimer();
      },
    );
  }

  void newOrderTimer() {
    timePassed = DateTime.now()
        .difference(widget.statusUpdateTime ?? DateTime.now())
        .inSeconds;
    timerText =
        "${(timePassed / 3600).floor()}:${"${((timePassed / 60) % 60).floor()}".padLeft(2, '0')}:${"${timePassed % 60}".padLeft(2, '0')}";

    setState(() {
      timerText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Время работы:',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: LightColorTheme.timerBackGround,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: LightColorTheme.timerBorderSide,
              ),
            ),
            child: Text(
              (widget.statusUpdateTime == null) ? "--/--/--" : timerText,
              style: const TextStyle(
                color: LightColorTheme.timerBorderSide,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
