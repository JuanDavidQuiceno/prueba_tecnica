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
    on<SearchHomeEvent>(_searchHomeEvent);
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

  FutureOr<void> _searchHomeEvent(
    SearchHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState(state.catModel));
    final catModelSearch = state.catModel
        .where(
          (element) => element.name!.toLowerCase().contains(event.query),
        )
        .toList();
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      return emit(
        HomeSearchState(
          catModel: state.catModel,
          catModelSearch: catModelSearch,
        ),
      );
    });
  }
}
