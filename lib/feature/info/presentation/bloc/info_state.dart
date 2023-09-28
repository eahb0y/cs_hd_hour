part of 'info_bloc.dart';

class InfoState extends Equatable {
  final List<InfoGetTimeModel>? timeModel;
  final bool isLoading;

  const InfoState({
    this.timeModel,
    required this.isLoading,
  });

  InfoState copyWith({
    List<InfoGetTimeModel>? timeModel,
    bool? isLoading
  }) {
    return InfoState(
      timeModel: timeModel ?? this.timeModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [timeModel, isLoading ];
}
