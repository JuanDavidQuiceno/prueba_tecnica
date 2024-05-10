part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState({required this.booksModel});
  final List<BookModel> booksModel;
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.booksModel});
}

final class HomeSearchState extends HomeState {
  const HomeSearchState({
    required super.booksModel,
    required this.searchbooksModel,
  });
  final List<BookModel> searchbooksModel;
}

// get new data

final class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.booksModel});
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({required super.booksModel});
}

final class HomeErrorState extends HomeState {
  const HomeErrorState({required this.message, required super.booksModel});
  final String message;
}

// Detail state
final class HomeLoadingDetailState extends HomeState {
  const HomeLoadingDetailState({required super.booksModel});
}

final class HomeLoadedDetailState extends HomeState {
  const HomeLoadedDetailState({
    required super.booksModel,
    required this.bookModel,
  });
  final BookModel bookModel;
}

final class HomeErrorDetailState extends HomeState {
  const HomeErrorDetailState({
    required this.message,
    required super.booksModel,
  });
  final String message;
}
