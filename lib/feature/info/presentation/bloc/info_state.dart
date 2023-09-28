part of 'info_bloc.dart';

class InfoState extends Equatable {
  final List<InfoGetTimeModel>? timeModel;
  final bool isLoading;
  final double? totalTime;
  final double? leftTime;
  final List<ChartData>? chartData;

  const InfoState({
    this.timeModel,
    required this.isLoading,
    this.totalTime,
    this.chartData,
    this.leftTime,
  });

  InfoState copyWith({
    List<InfoGetTimeModel>? timeModel,
    bool? isLoading,
    double? totalTime,
    List<ChartData>? chartData,
    double? leftTime,
  }) {
    return InfoState(
      timeModel: timeModel ?? this.timeModel,
      isLoading: isLoading ?? this.isLoading,
      totalTime: totalTime ?? this.totalTime,
      chartData: chartData ?? this.chartData,
      leftTime: leftTime ?? this.leftTime,
    );
  }

  @override
  List<Object?> get props =>
      [timeModel, isLoading, totalTime, chartData, leftTime];
}
