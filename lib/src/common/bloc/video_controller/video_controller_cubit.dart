import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_controller_state.dart';

class VideoControllerCubit extends Cubit<VideoControllerState> {
  VideoControllerCubit()
      : super(const VideoControllerInitial(controller: null));

  void setController(VideoPlayerController controller) {
    emit(
      VideoControllerInitial(controller: controller),
    );
  }

  void play() {
    try {
      if (state.controller!.value.isPlaying) {
        state.controller!.play();
      }
      {
        state.controller!.pause();
      }
    } catch (e) {
      // ignore: avoid_print
    }
  }

  void dispose() {
    state.controller!.dispose();
  }
}
