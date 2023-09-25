import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  MainBloc() : super(MainInitial()) {
    on<TimerStartEvent>(_startTimer);
    on<TimerPausedEvent>(_completedTimer);
    on<MainInitialCallEvent>(_checkInitialHasData);
  }

  Future<void> _startTimer(
      TimerStartEvent event, Emitter<MainState> emit) async {
    await FirebaseFirestore.instance
        .collection('open_space')
        .doc('100-hour')
        .collection(sl<LocalSource>().getClientName())
        .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .set({
      'name': sl<LocalSource>().getClientName(),
      'checkIn': event.dateTime,
      'checkOut': '--/--'
    });
    sl<LocalSource>().saveDateTime(event.dateTime);
    emit(ClientTimerCompleted());
  }

  Future<void> _completedTimer(
      TimerPausedEvent event, Emitter<MainState> emit) async {
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection('open_space')
        .doc('100-hour')
        .collection(sl<LocalSource>().getClientName())
        .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .get();
    await FirebaseFirestore.instance
        .collection('open_space')
        .doc('100-hour')
        .collection(sl<LocalSource>().getClientName())
        .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .update({
      'name': sl<LocalSource>().getClientName(),
      'checkIn': snap2['checkIn'],
      'checkOut': event.dateTime
    });
    sl<LocalSource>().deleteDateTime();
    emit(ClientTimerDoneState());
  }

  Future<void> _checkInitialHasData(event, Emitter<MainState> emit) async{
    if(sl<LocalSource>().checkDateTime()){
      emit(ClientTimerCompleted(dateTime: sl<LocalSource>().getDateTime()));
    }else{
      emit(ClientTimerDoneState());
    }
  }
}
