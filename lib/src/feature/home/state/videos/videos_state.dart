part of 'videos_cubit.dart';

sealed class VideosState extends Equatable {
  const VideosState({required this.videos});
  final List<VideoModel> videos;
  @override
  List<Object> get props => [];
}

final class VideosInitial extends VideosState {
  const VideosInitial({required super.videos});
}

final class VideosLoadingState extends VideosState {
  const VideosLoadingState({required super.videos});
}

final class VideosLoadedState extends VideosState {
  const VideosLoadedState({required super.videos});
}

final class VideosErrorState extends VideosState {
  const VideosErrorState({required super.videos, required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
