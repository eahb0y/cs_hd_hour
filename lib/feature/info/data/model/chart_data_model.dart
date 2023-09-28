class ChartData {
  ChartData({
    required this.x,
    required this.y,
    required this.color,
  });

  final String x;
  final double y;
  final String color;

  factory ChartData.fromJson(Map<String, dynamic>? json) {
    return ChartData(
      x: json?['status'],
      y: json?['totalTime'],
      color: json?['color'],
    );
  }
}
