part of 'main_bloc.dart';

sealed class MainState extends Equatable {}

final class MainInitial extends MainState {
  MainInitial();

  @override
  List<Object?> get props => [];
}

final class ClientTimerCompleted extends MainState {
  final int? totalTime;
  final int? totalPay;
  final String? dateTime;

  ClientTimerCompleted({this.totalPay, this.totalTime, this.dateTime});

  @override
  List<Object?> get props => [];
}

final class ClientTimerDoneState extends MainState {
  ClientTimerDoneState();

  @override
  List<Object?> get props => [];
}
