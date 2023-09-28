part of 'info_bloc.dart';

abstract class InfoEvent extends Equatable {}

class GetTimeEvent extends InfoEvent{
  GetTimeEvent();
  @override
  List<Object?> get props => [];

}