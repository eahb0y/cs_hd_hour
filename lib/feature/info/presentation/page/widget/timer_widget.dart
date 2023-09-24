import 'dart:async';

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
    return Text(
      (widget.statusUpdateTime == null) ? "--/--" : timerText,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 30,
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
