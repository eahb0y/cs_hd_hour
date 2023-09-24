part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool enviable;
  final bool isVisible;
  final bool isSuccess;
  final String? errorStatus;
  final bool isLoading;

  const AuthState(
      {required this.enviable,
      required this.isVisible,
      required this.isSuccess,
      this.errorStatus,
      required this.isLoading});

  AuthState copyWith({
    bool? enviable,
    bool? emailValid,
    bool? isVisible,
    bool? isSuccess,
    String? errorStatus,
    bool? isLoading,
  }) {
    return AuthState(
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
