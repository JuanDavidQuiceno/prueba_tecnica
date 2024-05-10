import 'dart:async';
import 'dart:convert';

import 'package:api_sdk/api_sdk.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/common/services/local_storage.dart';
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
  }

  FutureOr<void> _getDetailEvent(
    GetDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    _validateStorage(event, emit);
    // validamos que que el libro este en el estado y tenga la info completa
    final index = state.booksModel.indexWhere(
      (element) => element.isbn13 == event.model.isbn13,
    );
    // se valida si ya se cargo del local storage al estado
    if (index != -1 && state.booksModel[index].detailBooksModel != null) {
      return emit(
        HomeLoadedDetailState(
          booksModel: state.booksModel,
          bookModel: state.booksModel[index],
        ),
      );
    }
    // si las condiciones anteriores no se cumplen se carga el detalle del libro
    emit(HomeLoadingDetailState(booksModel: state.booksModel));
    await HomeImplementation(apiSdk: ApiSdk())
        .getDetail(event.model.isbn13)
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
          } else {
            // si no existe lo agregamos al stado y lo guarmos en el
            // local storage lo buscamos en la local storage
            state.booksModel
                .insert(0, event.model.copyWith(detailBooksModel: detailModel));
            _insertStore(event.model.copyWith(detailBooksModel: detailModel));
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

  void _insertStore(BookModel bookModel) {
    final resultRecent = LocalStorage.recentSearches;
    //============= decodificamos el string para asignarlo al modelo
    final resultRecentDecode = (resultRecent as List).map((e) {
      final decoded = json.decode(e as String);
      return BookModel.fromJson(decoded as Map<String, dynamic>);
    }).toList();
    if (resultRecent.isNotEmpty) {
      // buscamos el libro en la lista de libros recientes
      final indexRecent = resultRecentDecode.indexWhere(
        (element) => element.isbn13 == bookModel.isbn13,
      );
      // si el libro existe lo ponemos en la primera posicion
      if (indexRecent != -1) {
        if (resultRecentDecode.length == 5) {
          resultRecentDecode.removeLast();
        }
        resultRecentDecode
          ..removeAt(indexRecent)
          ..insert(
            0,
            bookModel,
          );
        // convertimos el modelo a un mapa
        final resultRecentEncode =
            resultRecentDecode.map((e) => json.encode(e.toJson())).toList();
        // convertimos el mapa a un string
        LocalStorage.recentSearches = resultRecentEncode;
      } else {
        // si no existe lo agregamos al stado y lo guarmos en el
        // local storage
        resultRecentDecode.insert(0, bookModel);
        // convertimos el modelo a un mapa
        final resultRecentEncode =
            resultRecentDecode.map((e) => json.encode(e.toJson())).toList();
        // convertimos el mapa a un string
        LocalStorage.recentSearches = resultRecentEncode;
      }
    } else {
      // si no existe lo agregamos al stado y lo guarmos en el
      // local storage
      resultRecentDecode.insert(0, bookModel);
      // convertimos el modelo a un mapa
      final resultRecentEncode =
          resultRecentDecode.map((e) => json.encode(e.toJson())).toList();
      // convertimos el mapa a un string
      LocalStorage.recentSearches = resultRecentEncode;
    }
  }

  // metodo para validar el local storage y el estado de la lista de libros
  void _validateStorage(
    GetDetailEvent event,
    Emitter<HomeState> emit,
  ) {
    try {
      // obtenemos los datos guardados en el local storage
      final resultRecent = LocalStorage.recentSearches;
      if (resultRecent.isNotEmpty) {
        //============= decodificamos el string para asignarlo al modelo
        final resultRecentDecode = (resultRecent as List).map((e) {
          final decoded = json.decode(e as String);
          return BookModel.fromJson(decoded as Map<String, dynamic>);
        }).toList();
        // ========================

        // buscamos el libro en la lista de libros recientes
        final indexRecent = resultRecentDecode.indexWhere(
          (element) => element.isbn13 == event.model.isbn13,
        );

        //============= si el libro no existe en la lista de libros recientes
        // lo agregamos teniendo en cuenta que solo se guardan 5 libros
        // recientes
        if (indexRecent == -1) {
          if (resultRecentDecode.length == 5) {
            resultRecentDecode.removeLast();
          }
          resultRecentDecode.insert(0, event.model);
          // convertimos el modelo a un mapa
          final resultRecentEncode =
              resultRecentDecode.map((e) => json.encode(e.toJson())).toList();
          // convertimos el mapa a un string
          LocalStorage.recentSearches = resultRecentEncode;
          // si el libro existe lo ponemos en la primera posicion
        } else {
          resultRecentDecode
            ..removeAt(indexRecent)
            ..insert(0, event.model);
          // convertimos el modelo a un mapa
          final resultRecentEncode =
              resultRecentDecode.map((e) => json.encode(e.toJson())).toList();
          // convertimos el mapa a un string
          LocalStorage.recentSearches = resultRecentEncode;
        }
        // ========================

        // ignore: lines_longer_than_80_chars
        // ============ verificacion en state de lista de libros recientes ==========
        //============= verificamos si existe en la lista de estado de libros
        final index = state.booksModel.indexWhere(
          (element) => element.isbn13 == event.model.isbn13,
        );
        // si existe lo ponemos en la primera posicion
        if (index != -1) {
          final booksModelTemp = state.booksModel[index].copyWith();
          state.booksModel
            ..removeAt(index)
            ..insert(0, booksModelTemp);
        } else {
          // si no existe lo agregamos a la lista de libros
          state.booksModel.insert(0, event.model);
        }
      }
    } catch (e) {
      return emit(
        HomeErrorDetailState(
          message: e.toString(),
          booksModel: state.booksModel,
        ),
      );
    }
  }
}
