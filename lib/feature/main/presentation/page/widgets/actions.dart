import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/main/presentation/bloc/main_bloc.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  IconButton(
                    onPressed: () {
                      context
                          .read<MainBloc>()
                          .add(const TimerStartEvent());
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
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<MainBloc>().add(const TimerPausedEvent());
                          sl<LocalSource>().removeStart();
                        },
                        icon: const Icon(Icons.pause_circle_filled_rounded),
                        color: Colors.purple,
                        iconSize: 90,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text("Начатое время : ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              )),
                          Text(
                            state.dateTime ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
            ClientTimerDoneState() => [
              IconButton(
                onPressed: () {
                  context
                      .read<MainBloc>()
                      .add(const TimerStartEvent());
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
