part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState({
    required this.model,
  });
  final RegisterModel model;
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial({
    required super.model,
  });
}

final class RegisterChangedState extends RegisterState {
  const RegisterChangedState({
    required super.model,
  });
}

final class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState({
    required super.model,
  });
}

final class RegisterSuccessState extends RegisterState {
  const RegisterSuccessState({
    required super.model,
  });
}

final class RegisterErrorState extends RegisterState {
  const RegisterErrorState({
    required super.model,
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [message];
}
