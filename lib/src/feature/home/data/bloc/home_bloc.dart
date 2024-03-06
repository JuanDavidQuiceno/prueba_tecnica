import 'dart:async';

import 'package:api_sdk/api_sdk.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/home/data/home_implementation.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial([])) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeEvent>(_getHomeEvent);
  }

  FutureOr<void> _getHomeEvent(
    GetHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState([]));
    try {
      emit(
        HomeLoadedState(
          catModel: await HomeImplementation(apiSdk: ApiSdk()).getHome(),
        ),
      );
    } catch (e) {
      emit(
        HomeErrorState(
          message: e.toString(),
          catModel: state.catModel,
        ),
      );
    }
  }
}
