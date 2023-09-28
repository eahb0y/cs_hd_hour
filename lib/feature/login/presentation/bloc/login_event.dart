part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class EnviableSubmitButton extends LoginEvent {
  final String email;
  final String password;

  const EnviableSubmitButton({
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class VisiblePasswordTextEvent extends LoginEvent {
  final bool isVisible;

  const VisiblePasswordTextEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class OnSubmitButtonEvent extends LoginEvent {
  final String email;
  final BuildContext context;
  final String password;

  const OnSubmitButtonEvent({
    required this.password,
    required this.context,
    required this.email,
  });

  @override
  List<Object?> get props => [email, password, context];
}
