import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/home/data/home_repository.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/video_model.dart';
import 'package:prueba_tecnica/src/feature/widgets/alerts/custom_alerts.dart';

part 'my_videos_state.dart';

class MyVideosCubit extends Cubit<MyVideosState> {
  MyVideosCubit() : super(const MyVideosInitial(videos: []));

  FutureOr<void> getVideos() async {
    emit(const MyVideosLoadingDataState(videos: []));
    try {
      final response = await HomeRepository().myVideos();
      final body = response.body as Map<String, dynamic>;
      if (response.statusCode == 200) {
        final result = body['result'] as Map<String, dynamic>;
        final videos = List<VideoModel>.from(
          (result['rows'] as List)
              .map((e) => VideoModel.fromJson(e as Map<String, dynamic>)),
        );
        emit(MyVideosLoadedState(videos: videos));
      } else {
        emit(
          MyVideosErrorState(
            videos: state.videos,
            message: body['message'] as String? ?? 'Error al cargar los videos',
          ),
        );
      }
    } catch (e) {
      emit(
        MyVideosErrorState(
          videos: state.videos,
          message: 'Error al cargar los videos',
        ),
      );
    }
  }

  // delete video
  FutureOr<void> deleteVideo(int id) async {
    emit(MyVideosLoadingState(videos: state.videos));
    try {
      final response = await HomeRepository().myVideosDelete(id);
      final body = response.body as Map<String, dynamic>;
      if (response.statusCode == 200) {
        // buscamos el video en la lista local y la eliminamos
        state.videos.removeWhere((element) => element.id == id);
        emit(
          MyVideosMessageState(
            videos: state.videos,
            type: AlertType.success,
            title: '¡Genial!',
            message: 'Video eliminado correctamente',
          ),
        );
      } else {
        emit(
          MyVideosMessageState(
            videos: state.videos,
            type: AlertType.error,
            title: 'Error',
            message: body['message'] as String? ?? 'Error al eliminar el video',
          ),
        );
      }
    } catch (e) {
      emit(
        MyVideosMessageState(
          videos: state.videos,
          type: AlertType.error,
          title: 'Error',
          message: 'Error al eliminar el video',
        ),
      );
    }
  }
}
