import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginInitial(
            email: '',
            password: '',
          ),
        );

  void changeEmail(String email) {
    emit(
      LoginInitial(
        email: email,
        password: state.password,
      ),
    );
    emit(
      LoginChangedState(
        email: state.email,
        password: state.password,
      ),
    );
  }

  void changePassword(String password) {
    emit(
      LoginInitial(
        email: state.email,
        password: password,
      ),
    );
    emit(
      LoginChangedState(
        email: state.email,
        password: state.password,
      ),
    );
  }

  FutureOr<void> submit() async {
    emit(
      LoginLoadingState(
        email: state.email,
        password: state.password,
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      LoginErrorState(
        email: state.email,
        password: state.password,
        message: 'Invalid email or password',
      ),
    );
  }
}
