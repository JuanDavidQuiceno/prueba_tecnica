part of 'video_controller_cubit.dart';

sealed class VideoControllerState extends Equatable {
  const VideoControllerState();

  @override
  List<Object> get props => [];
}

final class VideoControllerInitial extends VideoControllerState {
  const VideoControllerInitial();
}

final class VideoControllerPlaying extends VideoControllerState {
  const VideoControllerPlaying(this.model);
  final VideoModel model;
}

final class VideoControllerPaused extends VideoControllerState {
  const VideoControllerPaused();
}
