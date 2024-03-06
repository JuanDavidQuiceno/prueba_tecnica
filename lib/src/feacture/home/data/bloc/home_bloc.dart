import 'dart:async';

import 'package:api_sdk/api_sdk.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feacture/home/data/home_implementation.dart';
import 'package:prueba_tecnica/src/feacture/home/domain/models/home_model.dart';

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
          homeModel: await HomeImplementation(apiSdk: ApiSdk()).getHome(),
        ),
      );
    } catch (e) {
      emit(
        HomeErrorState(
          message: e.toString(),
          homeModel: state.homeModel,
        ),
      );
    }
  }
}
