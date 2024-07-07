import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/video_model.dart';

part 'video_controller_state.dart';

class VideoControllerCubit extends Cubit<VideoControllerState> {
  VideoControllerCubit() : super(const VideoControllerInitial());

  void setController() {
    emit(const VideoControllerInitial());
  }

  void play(VideoModel model) {
    emit(const VideoControllerInitial());
    emit(VideoControllerPlaying(model));
  }

  void pause() {
    emit(const VideoControllerInitial());
    emit(const VideoControllerPaused());
  }
}
