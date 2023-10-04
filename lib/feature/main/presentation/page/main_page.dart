import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/timer_widget.dart';
import 'package:cs_hd_hour/feature/main/presentation/bloc/main_bloc.dart';
import 'package:cs_hd_hour/feature/main/presentation/page/widgets/actions.dart';
import 'package:cs_hd_hour/feature/main/presentation/page/widgets/start_time_widget.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<MainBloc>().add(const MainInitialCallEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Главная',
              style: AppTextStyle.appBarText,
            ),
            backgroundColor: Colors.purple,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.clientInfo,
                  );
                },
                icon: const Icon(Icons.info_outline)),
            actions: [
              IconButton(
                iconSize: 30,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Вы хотите выйти ?',
                                      style: AppTextStyle.timeText),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                              horizontal: 35,
                                            ),
                                            backgroundColor: LightColorTheme
                                                .dialogCancelButton),
                                        child: Text(
                                          "Нет",
                                          style: AppTextStyle.dialogButtonText
                                              .copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          FirebaseAuth.instance.signOut();
                                          sl<LocalSource>().removeStart();
                                          sl<LocalSource>().deleteData();
                                          sl<LocalSource>().deleteDateTime();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              RoutesName.initialPage,
                                              (route) => false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                              horizontal: 35,
                                            ),
                                            backgroundColor: LightColorTheme
                                                .timerBorderSide),
                                        child: Text(
                                          "Да",
                                          style: AppTextStyle.dialogButtonText
                                              .copyWith(
                                            color: LightColorTheme.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                icon: const Icon(Icons.exit_to_app_sharp),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Привет, ${sl<LocalSource>().getClientName()}",
                  style: AppTextStyle.helloText,
                ),
                const SizedBox(
                  height: 15,
                ),
                ...switch (state) {
                  MainInitial() => [
                      const Column(
                        children: [
                          StartTimeWidget(startTime: '--/--'),
                          SizedBox(
                            height: 40,
                          ),
                          TimerWidget(),
                        ],
                      )
                    ],
                  ClientTimerCompleted() => [
                      Column(
                        children: [
                          StartTimeWidget(
                              startTime: sl<LocalSource>().getDateTime()),
                          const SizedBox(
                            height: 40,
                          ),
                          TimerWidget(
                            statusUpdateTime: DateTime.tryParse(
                                sl<LocalSource>().getDateTime()),
                          ),
                        ],
                      )
                    ],
                  ClientTimerDoneState() => [
                      const Column(
                        children: [
                          StartTimeWidget(startTime: '--/--'),
                          SizedBox(
                            height: 40,
                          ),
                          TimerWidget(),
                        ],
                      )
                    ]
                },
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          bottomNavigationBar: const SafeArea(
            minimum: EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionsButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
