import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
import 'package:cs_hd_hour/feature/info/presentation/bloc/info_bloc.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/chech_time.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/radial_bar_chart.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/visit_time_date_widget.dart';
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
            title: const Text(
              'Полная информация',
              style: AppTextStyle.appBarText,
            ),
            backgroundColor: LightColorTheme.buttonBackgroundColor,
          ),
          body: state.chartData?.isNotEmpty ?? false
              ? Column(
                  children: [
                    RadialBarChart(
                      totalTime: state.totalTime ?? 0,
                      chartData: state.chartData,
                      leftTime: state.leftTime ?? 0,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                ListView.builder(
                                  itemCount: state.timeModel?.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      children: [
                                        VisitTimeDateWidget(
                                            time: state.timeModel?[index]
                                                    .checkIn ??
                                                ''),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CheckTime(
                                            title: "Начало:",
                                            time: state.timeModel?[index]
                                                    .checkIn ??
                                                ''),
                                        const Divider(),
                                        CheckTime(
                                            title: "Окончание:",
                                            time: state.timeModel?[index]
                                                    .checkOut ??
                                                ''),
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
