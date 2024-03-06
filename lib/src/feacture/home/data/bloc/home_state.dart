part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState(this.homeModel);
  final List<HomeModel> homeModel;
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial(super.homeModel);
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState(super.homeModel);
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required List<HomeModel> homeModel,
  }) : super(homeModel);
}

final class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.message,
    required List<HomeModel> homeModel,
  }) : super(homeModel);
  final String message;
}
