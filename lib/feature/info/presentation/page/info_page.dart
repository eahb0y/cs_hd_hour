import 'package:cs_hd_hour/feature/info/presentation/page/widget/radial_bar_chart.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RadialBarChart(),
        ],
      ),
    );
  }
}
