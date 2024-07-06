import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/auth/data/auth_repository.dart';

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
    await AuthRepository()
        .login(email: state.email, password: state.password)
        .then(
      (value) {
        try {
          final body = value.body as Map<String, dynamic>;
          if (value.statusCode == 200) {
            // guardamos el token en el storage que llega en la cabecera

            emit(
              LoginSuccessState(
                email: state.email,
                password: state.password,
              ),
            );
          } else {
            emit(
              LoginErrorState(
                email: state.email,
                password: state.password,
                message:
                    body['message'] as String? ?? 'Error al iniciar sesion',
              ),
            );
          }
        } catch (e) {
          final body = value.body as Map<String, dynamic>;
          emit(
            LoginErrorState(
              email: state.email,
              password: state.password,
              message: body['message'] as String? ?? 'Error al iniciar sesion',
            ),
          );
        }
      },
    ).catchError(
      (e) {
        emit(
          LoginErrorState(
            email: state.email,
            password: state.password,
            message: 'Error al iniciar sesionn',
          ),
        );
      },
    );
  }
}
