part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool enviable;
  final bool isVisible;
  final bool isSuccess;
  final String? errorStatus;
  final bool isLoading;

  const LoginState({
    required this.enviable,
    required this.isVisible,
    required this.isSuccess,
    this.errorStatus,
    required this.isLoading,
  });

  LoginState copyWith({
    bool? enviable,
    bool? isVisible,
    bool? isSuccess,
    String? errorStatus,
    bool? isLoading,
  }) {
    return LoginState(
      enviable: enviable ?? this.enviable,
      isVisible: isVisible ?? this.isVisible,
      isSuccess: isSuccess ?? this.isSuccess,
      errorStatus: errorStatus ?? this.errorStatus,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [enviable, isVisible, isSuccess, errorStatus, isLoading];
}
