import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/feature/home/data/home_repository.dart';
import 'package:prueba_tecnica/src/feature/widgets/alerts/custom_alerts.dart';

part 'add_video_state.dart';

class AddVideoCubit extends Cubit<AddVideoState> {
  AddVideoCubit()
      : super(
          const AddVideoInitial(
            titleVideo: '',
            descriptionVideo: '',
            pathVideo: null,
          ),
        );

  void setTitle(String title) {
    emit(
      AddVideoInitial(
        titleVideo: title,
        descriptionVideo: state.descriptionVideo,
        pathVideo: state.pathVideo,
      ),
    );
    emit(
      AddVideoChangeState(
        titleVideo: state.titleVideo,
        descriptionVideo: state.descriptionVideo,
        pathVideo: state.pathVideo,
      ),
    );
  }

  void setDescription(String description) {
    emit(
      AddVideoInitial(
        titleVideo: state.titleVideo,
        descriptionVideo: description,
        pathVideo: state.pathVideo,
      ),
    );
    emit(
      AddVideoChangeState(
        titleVideo: state.titleVideo,
        descriptionVideo: state.descriptionVideo,
        pathVideo: state.pathVideo,
      ),
    );
  }

  void addVideo(File? path) {
    emit(
      AddVideoPathState(
        titleVideo: state.titleVideo,
        descriptionVideo: state.descriptionVideo,
        pathVideo: path,
      ),
    );
  }

  void deleteVideo() {
    emit(
      AddVideoPathDeleteState(
        titleVideo: state.titleVideo,
        descriptionVideo: state.descriptionVideo,
        pathVideo: null,
      ),
    );
  }

  FutureOr<void> send() async {
    emit(
      AddVideoLoadingState(
        titleVideo: state.titleVideo,
        descriptionVideo: state.descriptionVideo,
        pathVideo: state.pathVideo,
      ),
    );
    try {
      // send data
      final responses = await HomeRepository().myVideosCreate(
        description: state.descriptionVideo,
        title: state.titleVideo,
        path: state.pathVideo?.path ?? '',
      );
      if (responses.statusCode == 201) {
        emit(
          AddVideoLoadedState(
            titleVideo: state.titleVideo,
            descriptionVideo: state.descriptionVideo,
            pathVideo: state.pathVideo,
          ),
        );
      } else {
        emit(
          AddVideoMessageState(
            titleVideo: state.titleVideo,
            descriptionVideo: state.descriptionVideo,
            pathVideo: state.pathVideo,
            type: AlertType.error,
            title: 'Error',
            message: 'Error los datos',
          ),
        );
      }
    } catch (e) {
      emit(
        AddVideoMessageState(
          titleVideo: state.titleVideo,
          descriptionVideo: state.descriptionVideo,
          pathVideo: state.pathVideo,
          type: AlertType.error,
          title: 'Error',
          message: 'Error los datos',
        ),
      );
    }
  }
}
