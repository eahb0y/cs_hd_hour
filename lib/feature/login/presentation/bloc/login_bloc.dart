

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(enviable: false, isVisible: false)) {
    on<EnviableSubmitButton>(_enviableSubmitButton);
    on<VisiblePasswordTextEvent>(_visibleText);
  }
  void _enviableSubmitButton(EnviableSubmitButton event, Emitter<LoginState>emit){
    if(event.email.length > 1 && event.password.length > 1){
      emit(state.copyWith(enviable: true));
    }
    else{
      emit(state.copyWith(enviable: false));
    }
  }

  void _visibleText(VisiblePasswordTextEvent event, Emitter<LoginState>emit) {
    emit(state.copyWith(isVisible: !event.isVisible));
  }
}
