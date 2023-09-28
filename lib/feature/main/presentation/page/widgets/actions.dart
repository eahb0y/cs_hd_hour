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
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...switch (state) {
              MainInitial() => [
                  Column(
                    children: [
                      Text(
                        'Запустить таймер',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.purple.shade500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          String currentDay = DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(DateTime.now());
                          context
                              .read<MainBloc>()
                              .add(TimerStartEvent(dateTime: currentDay));
                        },
                        icon: const Icon(Icons.play_arrow_sharp),
                        color: Colors.purple,
                        iconSize: 90,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ClientTimerCompleted() => [
                  Column(
                    children: [
                      Text(
                        'Остановить таймер',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.purple.shade500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          String currentDay = DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(DateTime.now());
                          context
                              .read<MainBloc>()
                              .add(TimerPausedEvent(dateTime: currentDay));
                          sl<LocalSource>().deleteDateTime();
                        },
                        icon: const Icon(Icons.pause_circle_filled_rounded),
                        color: Colors.purple,
                        iconSize: 90,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ClientTimerDoneState() => [
                  Column(
                    children: [
                      Text(
                        'Запустить таймер',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.purple.shade500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          String currentDay = DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(DateTime.now());
                          context
                              .read<MainBloc>()
                              .add(TimerStartEvent(dateTime: currentDay));
                        },
                        icon: const Icon(Icons.play_arrow_sharp),
                        color: Colors.purple,
                        iconSize: 90,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ]
            }
          ],
        );
      },
    );
  }
}
