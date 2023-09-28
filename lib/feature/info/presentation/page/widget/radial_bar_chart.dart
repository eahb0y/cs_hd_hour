import 'package:cs_hd_hour/core/functions/base_functions.dart';
import 'package:cs_hd_hour/feature/info/data/model/chart_data_model.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/time_box.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChart extends StatelessWidget {
  final List<ChartData>? chartData;
  final double totalTime;
  final double leftTime;

  const RadialBarChart({
    super.key,
    required this.totalTime,
    required this.leftTime,
    this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SfCircularChart(
          borderWidth: 0,
          margin: EdgeInsets.zero,
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Общий',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '6000 минут',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
          series: <CircularSeries>[
            // Renders doughnut chart
            DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) =>
                  Color(Functions.hexColor(data.color)),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              cornerStyle: CornerStyle.bothCurve,
              innerRadius: "103",
              radius: "113",
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeBox(
                status: 'Осталось',
                num: totalTime.toInt(),
              ),
              TimeBox(
                status: 'Потрачено',
                num: leftTime.toInt(),
              )
            ],
          ),
        )
      ],
    );
  }
}
