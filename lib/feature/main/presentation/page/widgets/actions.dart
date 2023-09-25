import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/main/presentation/bloc/main_bloc.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ActionsButton extends StatelessWidget {
  const ActionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        String currentDay =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...switch (state) {
              MainInitial() => [
                  IconButton(
                    onPressed: () {
                      context
                          .read<MainBloc>()
                          .add(TimerStartEvent(dateTime: currentDay));
                      sl<LocalSource>().setStartTime(true);
                    },
                    icon: const Icon(Icons.play_arrow_sharp),
                    color: Colors.purple,
                    iconSize: 90,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ClientTimerCompleted() => [
                  IconButton(
                    onPressed: () {
                      context
                          .read<MainBloc>()
                          .add(TimerPausedEvent(dateTime: currentDay));
                      sl<LocalSource>().removeStart();
                    },
                    icon: const Icon(Icons.pause_circle_filled_rounded),
                    color: Colors.purple,
                    iconSize: 90,
                  ),
                ],
              ClientTimerDoneState() => [
                  IconButton(
                    onPressed: () {
                      context
                          .read<MainBloc>()
                          .add(TimerStartEvent(dateTime: currentDay));
                      sl<LocalSource>().setStartTime(true);
                    },
                    icon: const Icon(Icons.play_arrow_sharp),
                    color: Colors.purple,
                    iconSize: 90,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]
            }
          ],
        );
      },
    );
  }
}
