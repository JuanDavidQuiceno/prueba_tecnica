import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(
          RegisterInitial(
            model: RegisterModel.fromJson({}),
          ),
        );

  void changeName(String name) {
    emit(
      RegisterInitial(
        model: state.model.copyWith(name: name),
      ),
    );
    emit(
      RegisterChangedState(
        model: state.model,
      ),
    );
  }

  void changeLastName(String lastName) {
    emit(
      RegisterInitial(
        model: state.model.copyWith(lastName: lastName),
      ),
    );
    emit(
      RegisterChangedState(
        model: state.model,
      ),
    );
  }

  void changeEmail(String email) {
    emit(
      RegisterInitial(
        model: state.model.copyWith(email: email),
      ),
    );
    emit(
      RegisterChangedState(
        model: state.model,
      ),
    );
  }

  void changePassword(String password) {
    emit(
      RegisterInitial(
        model: state.model.copyWith(password: password),
      ),
    );
    emit(
      RegisterChangedState(
        model: state.model,
      ),
    );
  }

  void changePhone(String phone) {
    emit(
      RegisterInitial(
        model: state.model.copyWith(phone: phone),
      ),
    );
    emit(
      RegisterChangedState(
        model: state.model,
      ),
    );
  }

  FutureOr<void> submit() async {
    emit(
      RegisterLoadingState(
        model: state.model,
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      RegisterErrorState(
        model: state.model,
        message: 'Invalid email or password',
      ),
    );
  }
}
