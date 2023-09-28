import 'package:cs_hd_hour/core/local_data/local_source.dart';
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
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String clientName = sl<LocalSource>().getClientName();

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
            title: Text(
              clientName,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
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
                                  const Text(
                                    'Вы уверены что хотите выйти',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                      sl<LocalSource>().removeStart();
                                      sl<LocalSource>().deleteData();
                                      sl<LocalSource>().deleteDateTime();
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          RoutesName.login, (route) => false);
                                    },
                                    child: const Text("Подтвердить"),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Отменить"),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                icon: const Icon(Icons.exit_to_app_sharp),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ...switch (state) {
                    MainInitial() => [
                        const TimerWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        const StartTimeWidget(startTime: '--/--'),
                      ],
                    ClientTimerCompleted() => [
                        TimerWidget(
                          statusUpdateTime: DateTime.tryParse(
                              sl<LocalSource>().getDateTime()),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        StartTimeWidget(
                            startTime: sl<LocalSource>().getDateTime()),
                      ],
                    ClientTimerDoneState() => [
                        const TimerWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        const StartTimeWidget(startTime: '--/--'),
                      ]
                  }
                ],
              ),
            ),
          ),
          bottomNavigationBar: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionsButton(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
