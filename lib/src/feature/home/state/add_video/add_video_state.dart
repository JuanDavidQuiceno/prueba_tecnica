part of 'add_video_cubit.dart';

sealed class AddVideoState extends Equatable {
  const AddVideoState({
    required this.titleVideo,
    required this.descriptionVideo,
    required this.pathVideo,
  });
  final String titleVideo;
  final String descriptionVideo;
  final File? pathVideo;

  @override
  List<Object> get props => [];
}

final class AddVideoInitial extends AddVideoState {
  const AddVideoInitial({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
  });
}

final class AddVideoLoadingState extends AddVideoState {
  const AddVideoLoadingState({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
  });
}

final class AddVideoLoadedState extends AddVideoState {
  const AddVideoLoadedState({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
  });
}

final class AddVideoChangeState extends AddVideoState {
  const AddVideoChangeState({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
  });
}

final class AddVideoPathState extends AddVideoState {
  const AddVideoPathState({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
  });
}

final class AddVideoPathDeleteState extends AddVideoState {
  const AddVideoPathDeleteState({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
  });
}

final class AddVideoMessageState extends AddVideoState {
  const AddVideoMessageState({
    required super.titleVideo,
    required super.descriptionVideo,
    required super.pathVideo,
    required this.title,
    required this.message,
    required this.type,
  });

  final String title;
  final String message;
  final AlertType type;
  @override
  List<Object> get props => [title, message, type];
}
