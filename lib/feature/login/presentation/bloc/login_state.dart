part of 'login_bloc.dart';

class LoginState extends Equatable{
  final bool enviable;
  final bool isVisible;
  const LoginState({
    required this.enviable,
    required this.isVisible
});

  LoginState copyWith({
    bool? enviable,
    bool? isVisible,
}){
    return LoginState(
      enviable: enviable ?? this.enviable,
      isVisible: isVisible ?? this.isVisible,
    );
  }
  @override
  List<Object?> get props => [enviable, isVisible];
}

