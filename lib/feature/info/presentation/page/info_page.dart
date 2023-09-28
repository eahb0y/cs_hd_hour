import 'package:cs_hd_hour/feature/info/presentation/bloc/info_bloc.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/data_box.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/radial_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoBloc, InfoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Полная информация'),
            backgroundColor: Colors.purple.shade300,
          ),
          body: state.chartData?.isNotEmpty ?? false
              ? Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              RadialBarChart(
                  totalTime: state.totalTime ?? 0,
                  chartData: state.chartData,
                  leftTime: state.leftTime ?? 0,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Время прихода и ухода',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                  children: [
                    const Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        DataBox(
                          data: 'Пришел',
                        ),
                        DataBox(
                          data: 'Ушел',
                        ),
                      ],
                    ),
                    const Divider(
                      endIndent: 32,
                      indent: 32,
                      color: Colors.black87,
                      thickness: 1,
                    ),
                    state.timeModel?.isEmpty ?? false
                        ? const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Вы еще не начинали работу',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                        : ListView.builder(
                      itemCount: state.timeModel?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            DataBox(
                              data: state.timeModel?[index]
                                  .checkIn ??
                                  '--/--',
                            ),
                            DataBox(
                              data: state.timeModel?[index]
                                  .checkOut ??
                                  '--/--',
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
