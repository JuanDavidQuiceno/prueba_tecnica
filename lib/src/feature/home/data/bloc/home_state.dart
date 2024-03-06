part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState(this.catModel);
  final List<CatModel> catModel;
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial(super.catModel);
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState(super.hCatModel);
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required List<CatModel> catModel,
  }) : super(catModel);
}

final class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.message,
    required List<CatModel> catModel,
  }) : super(catModel);
  final String message;
}
