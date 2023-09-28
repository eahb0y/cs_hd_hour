import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/login/presentation/arguments/login_argument.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(
          enviable: false,
          isVisible: false,
          isSuccess: false,
          isLoading: false,
        )) {
    on<EnviableSubmitButton>(_enviableSubmitButton);
    on<VisiblePasswordTextEvent>(_visibleText);
    on<OnSubmitButtonEvent>(_onSubmitButton);
  }

  void _enviableSubmitButton(
      EnviableSubmitButton event, Emitter<LoginState> emit) {
    if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(event.email) &&
        event.password.length > 1) {
      emit(state.copyWith(enviable: true));
    } else {
      emit(state.copyWith(enviable: false));
    }
  }

  void _visibleText(VisiblePasswordTextEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isVisible: !event.isVisible));
  }

  Future<void> _onSubmitButton(OnSubmitButtonEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password)
          .then((value) async {
        await _setUser(event.email);
        Navigator.pushNamed(event.context, RoutesName.main);
        emit(state.copyWith(isSuccess: true));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(state.copyWith(
            isSuccess: false,
            errorStatus: 'Такого пользователя не существует',
        isLoading: false));
      } else if (e.code == 'wrong-password') {
        emit(state.copyWith(
            isSuccess: false, errorStatus: 'Неправильный пароль', isLoading: false));
      }
    } catch (e){
      throw ' exsecpion ${e.toString()}';
    }
    print('dadasda, ${state.isSuccess}');
  }

  Future<void> _setUser(String email) async {
    late LoginArgument argument;
    final response = await FirebaseFirestore.instance
        .collection('100-hour')
        .where('email', isEqualTo: email)
        .get();
    for (var element in response.docs) {
      argument = LoginArgument.fromFirebase(element.data());
    }
    sl<LocalSource>().setClientName(name: argument.name);
  }
}
