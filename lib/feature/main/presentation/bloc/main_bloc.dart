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
  String currentDay = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  MainBloc() : super(MainInitial()) {
    on<TimerStartEvent>(_startTimer);
    on<TimerPausedEvent>(_completedTimer);
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
      'checkIn': currentDay,
      'checkOut': '--/--'
    });
    sl<LocalSource>().saveDateTime(currentDay);
    emit(ClientTimerCompleted(dateTime: currentDay));
  }

  Future<void> _completedTimer(
      TimerPausedEvent event, Emitter<MainState> emit) async {
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection('open_space')
        .doc('100-hour')
        .collection(sl<LocalSource>().getClientName())
        .doc(currentDay)
        .get();
    await FirebaseFirestore.instance
        .collection('open_space')
        .doc('100-hour')
        .collection(sl<LocalSource>().getClientName())
        .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .update({
      'name': sl<LocalSource>().getClientName(),
      'checkIn': snap2['checkIn'],
      'checkOut': currentDay
    });
    emit(ClientTimerDoneState());
  }
}
