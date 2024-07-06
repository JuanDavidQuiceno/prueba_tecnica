part of 'my_videos_cubit.dart';

sealed class MyVideosState extends Equatable {
  const MyVideosState({required this.videos});
  final List<VideoModel> videos;
  @override
  List<Object> get props => [];
}

final class MyVideosInitial extends MyVideosState {
  const MyVideosInitial({required super.videos});
}

final class MyVideosLoadingState extends MyVideosState {
  const MyVideosLoadingState({required super.videos});
}

final class MyVideosLoadedState extends MyVideosState {
  const MyVideosLoadedState({required super.videos});
}

final class MyVideosErrorState extends MyVideosState {
  const MyVideosErrorState({required super.videos, required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
