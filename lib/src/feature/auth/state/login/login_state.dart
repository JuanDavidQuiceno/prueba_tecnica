part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial({
    required super.email,
    required super.password,
  });
}

final class LoginChangedState extends LoginState {
  const LoginChangedState({
    required super.email,
    required super.password,
  });
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState({
    required super.email,
    required super.password,
  });
}

final class LoginSuccessState extends LoginState {
  const LoginSuccessState({
    required super.email,
    required super.password,
  });
}

final class LoginErrorState extends LoginState {
  const LoginErrorState({
    required super.email,
    required super.password,
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [message];
}
