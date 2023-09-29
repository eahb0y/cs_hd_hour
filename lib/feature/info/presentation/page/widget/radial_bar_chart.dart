import 'package:cs_hd_hour/core/functions/base_functions.dart';
import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:cs_hd_hour/core/theme/text_style/app_text_style.dart';
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
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TimeBox(
              status: 'Осталось:',
              num: totalTime.toInt(),
              backGroundColor: LightColorTheme.startTimeBackGround,
              labelColor: LightColorTheme.buttonBackgroundColor,
              timeColor: LightColorTheme.buttonBackgroundColor,
            ),
            TimeBox(
              status: 'Утрачено:',
              num: leftTime.toInt(),
              backGroundColor: LightColorTheme.timerBorderSide,
              timeColor: LightColorTheme.white,
              labelColor: LightColorTheme.white,
            )
          ],
        ),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '6000мин',
                    style: AppTextStyle.radialChart,
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
      ],
    );
  }
}
