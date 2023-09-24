import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChart extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Success', 88, Colors.green),
    ChartData('Error', 42, Colors.red),
  ];

  RadialBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return  SfCircularChart(
      borderWidth: 0,
      margin: EdgeInsets.zero,
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Общий'
              ),
              SizedBox(height: 8,),
              Text(
                '6000 минут',
              ),
            ],
          ),
        ),
      ],
      series: <CircularSeries>[
        // Renders doughnut chart
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          innerRadius: "103",
          radius: "113",
        ),
      ],
    );

  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

