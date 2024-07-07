import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'file_event.dart';
part 'file_state.dart';

enum CustomExtension {
  pdf,
  doc,
  docx,
  xls,
  xlsx,
  ppt,
  pptx,
  csv,
  png,
  jpg,
  jpeg,
  webp,
  gif,
  svg,
  mp4,
}

class FileBloc extends Bloc<FileEvent, FileState> {
  FileBloc() : super(FileInitial()) {
    on<FileEvent>((event, emit) {});
    // on<FileCameraEvent>(_cameraState);
    // on<FileGalleryEvent>(_galleryState);
    on<FileDocumentEvent>(_documentState);
  }

  // Future<void> _cameraState(
  //   FileCameraEvent event,
  //   Emitter<FileState> emit,
  // ) async {
  //   try {
  //     emit(FileLoadingState());
  //     await PermissionServices.requestPermission(Permission.camera)
  //         .then((value) async {
  //       if (value) {
  //         await _loadCamera(emit: emit, imageSource: event.imageSource);
  //       } else {
  //         return emit(
  //           FileMessagePermissionState(
  //             title: translate('permission.title'),
  //             message: translate('permission.camera.message'),
  //           ),
  //         );
  //       }
  //     });
  //   } catch (e) {
  //     return emit(
  //       FileMessageState(
  //         title: translate('permission.title'),
  //         message: translate('permission.error'),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _loadCamera({
  //   required Emitter<FileState> emit,
  //   required ImageSource imageSource,
  //   int? quality,
  // }) async {
  //   final pickedFile = await ImagePicker().(
  //     source: imageSource,
  //     imageQuality: quality,
  //   );
  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     // final imageTemp = await decodeImageFromList(bytes);
  //     return emit(
  //       FileLoadedState(
  //         file: File(pickedFile.path),
  //         bytes: bytes,
  //         image: Image.memory(bytes),
  //       ),
  //     );
  //   } else {
  //     return emit(
  //       FileMessageState(
  //         title: translate('permission.title'),
  //         message: translate('permission.camera.noPhoto'),
  //       ),
  //     );
  //   }
  // }

  // // ======= Gallery =========
  // FutureOr<void> _galleryState(
  //   FileGalleryEvent event,
  //   Emitter<FileState> emit,
  // ) async {
  //   try {
  //     emit(FileLoadingState());
  //     await PermissionServices.multiplePermission([
  //       Permission.photos,
  //       Permission.storage,
  //       Permission.mediaLibrary,
  //     ]);
  //     // final data = await FilePicker.platform.pickFiles(
  //     //   // allowMultiple: event.isMultiple!,
  //     //   type: FileType.custom,
  //     // //   allowedExtensions: [
  //     // //     'pdf',
  //     // //     'doc',
  //     // //     'docx',
  //     // //     'xls',
  //     // //     'xlsx',
  //     // //     'ppt',
  //     // //     'pptx',
  //     // //     'csv',
  //     // //     'png',
  //     // //     'jpg',
  //     // //     'jpeg',
  //     // //   ],
  //     // );

  //     // if (data != null || data!.files.isNotEmpty) {
  //     //   emit(
  //     //     FilesLoadedState(
  //     //       files: data.files.map((e) => File(e.path!)).toList(),
  //     //     ),
  //     //   );
  //     // } else {
  //     //   emit(
  //     //     FileMessageState(
  //     //       title: translate('permission.title'),
  //     //       message: translate('permission.error'),
  //     //     ),
  //     //   );
  //     // }
  //     final pickedFile = await ImagePicker().pickImage(
  //       source: event.imageSource,
  //       imageQuality: event.imageQuality,
  //     );

  //     if (pickedFile != null) {
  //       final bytes = await pickedFile.readAsBytes();
  //       // final imageTemp = await decodeImageFromList(bytes);
  //       return emit(
  //         FileLoadedState(
  //           file: File(pickedFile.path),
  //           bytes: bytes,
  //           image: Image.memory(bytes),
  //         ),
  //       );
  //     } else {
  //       return emit(
  //         FileMessageState(
  //           title: translate('permission.title'),
  //           message: translate('permission.error'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     return emit(
  //       FileMessageState(
  //         title: translate('permission.title'),
  //         message: translate('permission.error'),
  //       ),
  //     );
  //   }
  // }

  FutureOr<void> _documentState(
    FileDocumentEvent event,
    Emitter<FileState> emit,
  ) async {
    try {
      emit(FileLoadingState());
      final result = await FilePicker.platform.pickFiles(
        type: event.fileType!,
        allowMultiple: event.isMultiple!,
        allowedExtensions: event.customExtension != null
            ? event.customExtension!.map((e) => e.name).toList()
            : [CustomExtension.pdf.name],
      );
      // si es multiple retornamos un arreglo de archivos
      if (event.isMultiple!) {
        if (result != null && result.files.isNotEmpty) {
          return emit(
            FilesLoadedState(
              files: result.files.map((e) => File(e.path!)).toList(),
            ),
          );
        } else {
          return emit(
            const FileMessageState(
              title: '¡Ups!',
              message: 'Parece que no seleccionaste ningun video',
            ),
          );
        }
        // si son archivos unicos retornamos un solo archivo
      } else {
        if (result != null && result.files.isNotEmpty) {
          return emit(
            FileLoadedState(
              file: File(result.files.first.path!),
              image: Image.file(File(result.files.first.path!)),
            ),
          );
        } else {
          return emit(
            const FileMessageState(
              title: '¡Ups!',
              message: 'Parece que no seleccionaste ningun video',
            ),
          );
        }
      }
    } catch (e) {
      return emit(
        const FileMessageState(
          title: '¡Ups!',
          message: 'Tenemos problemas para cargar el video',
        ),
      );
    }
  }
}
