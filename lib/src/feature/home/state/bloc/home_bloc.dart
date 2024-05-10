import 'dart:async';

import 'package:api_sdk/api_sdk.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/home/data/home_implementation.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/books_model.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/detail_book_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(booksModel: [])) {
    on<HomeInitialEvent>((event, emit) {
      emit(HomeInitial(booksModel: state.booksModel));
    });
    on<GetHomeEvent>(_getHomeEvent);
    on<SearchHomeEvent>(_searchHomeEvent);
    on<GetDetailEvent>(_getDetailEvent);
  }

  FutureOr<void> _getHomeEvent(
    GetHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState(booksModel: []));
    try {
      await HomeImplementation(apiSdk: ApiSdk()).getNew().then((value) {
        if (value.statusCode == 200) {
          try {
            final body = value.body as Map<String, dynamic>;
            final booksModel = BooksModel.fromJson(body);
            emit(HomeLoadedState(booksModel: booksModel.books));
          } catch (e) {
            emit(
              HomeErrorState(
                message: e.toString(),
                booksModel: state.booksModel,
              ),
            );
          }
        } else {
          emit(
            HomeErrorState(
              message: 'Error al cargar los datos',
              booksModel: state.booksModel,
            ),
          );
        }
      }).catchError((Object e) {
        emit(
          HomeErrorState(
            message: e.toString(),
            booksModel: state.booksModel,
          ),
        );
      });
      //   HomeLoadedState(
      // emit(,
      //   ),
      // );
    } catch (e) {
      emit(
        HomeErrorState(
          message: e.toString(),
          booksModel: state.booksModel,
        ),
      );
    }
  }

  FutureOr<void> _searchHomeEvent(
    SearchHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState(booksModel: state.booksModel));
    await HomeImplementation(apiSdk: ApiSdk())
        .searchBook(event.query)
        .then((value) {
      if (value.statusCode == 200) {
        try {
          final body = value.body as Map<String, dynamic>;
          final booksModel = BooksModel.fromJson(body);
          emit(
            HomeSearchState(
              booksModel: state.booksModel,
              searchbooksModel: booksModel.books,
            ),
          );
        } catch (e) {
          emit(
            HomeErrorState(
              message: e.toString(),
              booksModel: state.booksModel,
            ),
          );
        }
      } else {
        emit(
          HomeErrorState(
            message: 'Error al cargar los datos',
            booksModel: state.booksModel,
          ),
        );
      }
    }).catchError((Object e) {
      emit(
        HomeErrorState(
          message: e.toString(),
          booksModel: state.booksModel,
        ),
      );
    });
    // final catModelSearch =   state.booksModel,
    //     .where(
    //       (element) => element.name!.toLowerCase().contains(event.query),
    //     )
    //     .toList();
    // // ignore: inference_failure_on_instance_creation
    // await Future.delayed(const Duration(milliseconds: 500)).then((value) {
    //   return emit(
    //     HomeSearchState(
    //       catModel: state.catModel,
    //       catModelSearch: catModelSearch,
    //     ),
    //   );
    // });
  }

  FutureOr<void> _getDetailEvent(
    GetDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    final index =
        state.booksModel.indexWhere((element) => element.isbn13 == event.id);
    try {
      // si el libro existe y ya tiene el detalle no se vuelve a cargar
      if (index != -1 && state.booksModel[index].detailBooksModel != null) {
        return emit(
          HomeLoadedDetailState(
            booksModel: state.booksModel,
            bookModel: state.booksModel[index],
          ),
        );
      }
    } catch (e) {
      return emit(
        HomeErrorDetailState(
          message: e.toString(),
          booksModel: state.booksModel,
        ),
      );
    }

    // si las condiciones anteriores no se cumplen se carga el detalle del libro
    emit(HomeLoadingDetailState(booksModel: state.booksModel));
    await HomeImplementation(apiSdk: ApiSdk())
        .getDetail(event.id)
        .then((value) {
      if (value.statusCode == 200) {
        try {
          // convertimos los datos obtenidos a un mapa
          final body = value.body as Map<String, dynamic>;
          // convertimos el mapa a un modelo
          final detailModel = DetailBooksModel.fromJson(body);
          // en el estado buscamos el libro con el isbn13 y le asignamos el
          // detalle del libro obtenido
          if (index != -1) {
            state.booksModel[index].detailBooksModel = detailModel;
          }
          emit(
            HomeLoadedDetailState(
              booksModel: state.booksModel,
              bookModel: state.booksModel[index],
            ),
          );
        } catch (e) {
          emit(
            HomeErrorDetailState(
              message: e.toString(),
              booksModel: state.booksModel,
            ),
          );
        }
      } else {
        emit(
          HomeErrorDetailState(
            message: 'Error al cargar los datos',
            booksModel: state.booksModel,
          ),
        );
      }
    }).catchError((Object e) {
      emit(
        HomeErrorDetailState(
          message: e.toString(),
          booksModel: state.booksModel,
        ),
      );
    });
  }
}
