part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeInitialEvent extends HomeEvent {}

final class GetHomeEvent extends HomeEvent {}

final class SearchHomeEvent extends HomeEvent {
  const SearchHomeEvent(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}

final class GetDetailEvent extends HomeEvent {
  const GetDetailEvent(this.id);
  final String id;

  @override
  List<Object> get props => [id];
}
