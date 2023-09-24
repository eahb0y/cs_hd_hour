part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class TimerStartEvent extends MainEvent {
  const TimerStartEvent();

  @override
  List<Object?> get props => [];
}

class TimerPausedEvent extends MainEvent {
  const TimerPausedEvent();

  @override
  List<Object?> get props => [];
}

class GetTimerTimeEvent extends MainEvent {
  const GetTimerTimeEvent();

  @override
  List<Object?> get props => [];
}
