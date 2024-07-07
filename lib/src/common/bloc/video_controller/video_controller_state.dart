part of 'video_controller_cubit.dart';

sealed class VideoControllerState extends Equatable {
  const VideoControllerState({this.controller});
  final VideoPlayerController? controller;
  @override
  List<Object> get props => [];
}

final class VideoControllerInitial extends VideoControllerState {
  const VideoControllerInitial({
    required super.controller,
  });
}
