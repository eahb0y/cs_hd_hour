part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class EnviableSubmitButton extends AuthEvent {
  final String name;
  final String email;
  final String password;

  EnviableSubmitButton({
    required this.password,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [name, email, password];
}

class PasswordVisible extends AuthEvent {
  final bool isVisible;

  PasswordVisible({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class OnSubmitButtonEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  OnSubmitButtonEvent({
    required this.password,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [name, email, password];
}
