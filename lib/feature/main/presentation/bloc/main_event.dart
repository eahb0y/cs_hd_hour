part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainInitialCallEvent extends MainEvent {
  const MainInitialCallEvent();

  @override
  List<Object?> get props => [];
}

class TimerStartEvent extends MainEvent {
  final String dateTime;

  const TimerStartEvent({
    required this.dateTime,
  });

  @override
  List<Object?> get props => [];
}

class TimerPausedEvent extends MainEvent {
  final String dateTime;

  const TimerPausedEvent({
    required this.dateTime,
  });

  @override
  List<Object?> get props => [dateTime];
}

class GetTimerTimeEvent extends MainEvent {
  const GetTimerTimeEvent();

  @override
  List<Object?> get props => [];
}
