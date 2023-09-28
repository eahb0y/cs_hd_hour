
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/info/data/model/info_get_time_model.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(const InfoState(isLoading: false)) {
    on<GetTimeEvent>(_getTime);
  }

  Future<void> _getTime(GetTimeEvent event, Emitter<InfoState> emit) async{
    emit(state.copyWith(isLoading: true));
    try{
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
    } catch (e){
      throw(e.toString());
    }
  }
}

