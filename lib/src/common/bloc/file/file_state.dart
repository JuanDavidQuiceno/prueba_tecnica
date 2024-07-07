part of 'file_bloc.dart';

sealed class FileState extends Equatable {
  const FileState();

  @override
  List<Object> get props => [];
}

final class FileInitial extends FileState {}

final class FileLoadingState extends FileState {}

final class FileLoadedState extends FileState {
  const FileLoadedState({
    required this.file,
    required this.image,
    this.bytes,
  });
  final File file;
  final Uint8List? bytes;
  final Image image;
}

final class FilesLoadedState extends FileState {
  const FilesLoadedState({
    required this.files,
  });
  final List<File> files;
}

final class FileMessagePermissionState extends FileState {
  const FileMessagePermissionState({
    required this.title,
    required this.message,
  });
  final String title;
  final String message;
}

final class FileMessageState extends FileState {
  const FileMessageState({
    required this.title,
    required this.message,
  });
  final String title;
  final String message;
}
