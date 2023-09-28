import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/info/data/model/chart_data_model.dart';
import 'package:cs_hd_hour/feature/info/data/model/info_get_time_model.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_event.dart';

part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  var charDataFirebase = FirebaseFirestore.instance
      .collection('chart_data')
      .doc(sl<LocalSource>().getClientName());

  InfoBloc() : super(const InfoState(isLoading: false)) {
    on<InitialCallEvent>(_initialCall);
  }

  Future<void> _initialCall(
      InitialCallEvent event, Emitter<InfoState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _getTime(emit);
    await _calcTotalTime(emit);
    await _getTotalTime(emit);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _getTime(Emitter<InfoState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      List<InfoGetTimeModel> timeModel = [];
      final request = await FirebaseFirestore.instance
          .collection('open_space')
          .doc('100-hour')
          .collection(sl<LocalSource>().getClientName())
          .get();
      request.docs.forEach((element) {
        return timeModel.add(InfoGetTimeModel.fromJson(element.data()));
      });
      emit(state.copyWith(timeModel: timeModel, isLoading: false));
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> _calcTotalTime(Emitter<InfoState> emit) async {
    double totalTime = 6000;
    double leftTime = 0;

    final request = await FirebaseFirestore.instance
        .collection('open_space')
        .doc('100-hour')
        .collection(sl<LocalSource>().getClientName())
        .get();

    await Future.forEach(request.docs, (element) async {
      final checkIn = DateTime.tryParse(element['checkIn']);
      final checkOut = DateTime.tryParse(element['checkOut']);

      if (checkOut != null && checkIn != null) {
        leftTime += checkOut.difference(checkIn).inMinutes.abs();
      }
    });

    totalTime -= leftTime;

    await charDataFirebase
        .collection('success')
        .doc('success')
        .set({'status': 'Success', 'totalTime': totalTime, 'color': '79DC69'});
    await charDataFirebase
        .collection('error')
        .doc('error')
        .set({'status': 'error', 'totalTime': leftTime, 'color': 'FB4E4E'});
    emit(state.copyWith(totalTime: totalTime, leftTime: leftTime));
  }

  Future<void> _getTotalTime(Emitter<InfoState> emit) async {
    final List<ChartData> data = [];
    final requestOne = await charDataFirebase.collection('success').get();
    requestOne.docs.forEach((element) {
      return data.add(ChartData.fromJson(element.data()));
    });
    final requestTwo = await charDataFirebase.collection('error').get();
    requestTwo.docs.forEach((element) {
      return data.add(ChartData.fromJson(element.data()));
    });
    emit(state.copyWith(chartData: data));
  }
}
