part of 'file_bloc.dart';

sealed class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

// final class FileGalleryEvent extends FileEvent {
//   const FileGalleryEvent({
//     required this.imageSource,
//     this.imageQuality = 25,
//     this.isMultiple = true,
//   });
//   final ImageSource imageSource;
//   final int? imageQuality;
//   final bool? isMultiple;
// }

// final class FileCameraEvent extends FileEvent {
//   const FileCameraEvent({required this.imageSource, this.imageQuality = 25});
//   final ImageSource imageSource;
//   final int? imageQuality;
// }

final class FileDocumentEvent extends FileEvent {
  const FileDocumentEvent({
    this.fileType = FileType.any,
    this.isMultiple = false,
    this.customExtension,
  });
  final List<CustomExtension>? customExtension;
  final FileType? fileType;
  final bool? isMultiple;
}
