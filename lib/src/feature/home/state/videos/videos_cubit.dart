import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/home/data/home_repository.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/video_model.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(const VideosInitial(videos: []));

  FutureOr<void> getVideos() async {
    emit(const VideosLoadingState(videos: []));
    try {
      final response = await HomeRepository().videos();
      final body = response.body as Map<String, dynamic>;
      if (response.statusCode == 200) {
        final result = body['result'] as Map<String, dynamic>;
        final videos = List<VideoModel>.from(
          (result['rows'] as List)
              .map((e) => VideoModel.fromJson(e as Map<String, dynamic>)),
        );
        emit(VideosLoadedState(videos: videos));
      } else {
        emit(
          VideosErrorState(
            videos: state.videos,
            message: body['message'] as String? ?? 'Error al cargar los videos',
          ),
        );
      }
    } catch (e) {
      emit(
        VideosErrorState(
          videos: state.videos,
          message: 'Error al cargar los videos',
        ),
      );
    }
  }
}
