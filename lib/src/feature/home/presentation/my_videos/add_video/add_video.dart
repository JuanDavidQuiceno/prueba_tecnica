import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/common/bloc/file/file_bloc.dart';
import 'package:prueba_tecnica/src/common/services/navigation_services.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/home/home_screen.dart';

import 'package:prueba_tecnica/src/feature/home/state/add_video/add_video_cubit.dart';
import 'package:prueba_tecnica/src/feature/home/state/my_videos/my_videos_cubit.dart';
import 'package:prueba_tecnica/src/feature/widgets/alerts/custom_alerts.dart';
import 'package:prueba_tecnica/src/feature/widgets/buttons/custom_elevated_button.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_loading.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_text_field.dart';
import 'package:prueba_tecnica/src/utils/utils.dart';
import 'package:video_player/video_player.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({required this.cubit, super.key});
  static const String routeName = 'AddVideoScreen';
  final MyVideosCubit cubit;
  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  late AddVideoCubit cubit;
  VideoPlayerController? controller;
  FileBloc fileBloc = FileBloc();
  @override
  void initState() {
    cubit = AddVideoCubit();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    fileBloc.close();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FileBloc, FileState>(
          bloc: fileBloc,
          listener: (_, state) {
            if (state is FileMessageState) {
              CustomAlert.alertDialog(
                context,
                type: AlertType.error,
                title: state.title,
                message: state.message,
              );
            } else if (state is FileLoadedState) {
              cubit.addVideo(state.file);
              controller = VideoPlayerController.file(
                state.file,
              )..initialize().then((_) {
                  setState(() {});
                });
            }
          },
        ),
      ],
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Hero(
                tag: 'Add Video',
                child: Text(
                  'Agregar Video',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(child: _content(context)),
                _button(context),
              ],
            ),
          ),
          BlocConsumer<AddVideoCubit, AddVideoState>(
            bloc: cubit,
            listener: (_, state) {
              if (state is AddVideoLoadedState) {
                // mostamos mensaje de exito y ejecutamos la consulta nuevamente
                // en el bloc anterior para actualizar la lista de videos
                widget.cubit.getVideos();
                CustomAlert.alertDialog(
                  context,
                  type: AlertType.success,
                  title: '¡Genial!',
                  message: 'Publicación exitosa',
                ).then((value) {
                  NavigationServices.popUntil(
                    context,
                    routeName: HomeScreen.routeName,
                  );
                });
              } else if (state is AddVideoMessageState) {
                CustomAlert.alertDialog(
                  context,
                  type: state.type,
                  title: state.title,
                  message: state.message,
                );
              }
            },
            builder: (_, state) {
              if (state is AddVideoLoadingState) {
                return const CustomLoading();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMarginHorinzontal,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomTextField(
                  labelText: 'Titulo',
                  hintText: 'Ingrese el titulo del video',
                  onChanged: (value) => cubit.setTitle(value),
                ),
              ),
              CustomTextField(
                labelText: 'Descripción',
                hintText: 'Ingrese la descripción del video',
                onChanged: (value) => cubit.setDescription(value),
              ),
              BlocBuilder<AddVideoCubit, AddVideoState>(
                bloc: cubit,
                builder: (_, state) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: InkWell(
                          onTap: () {
                            if (state.pathVideo == null) {
                              fileBloc.add(
                                const FileDocumentEvent(
                                  fileType: FileType.custom,
                                  customExtension: [
                                    CustomExtension.mp4,
                                  ],
                                ),
                              );
                            } else {
                              cubit.deleteVideo();
                              controller?.dispose();
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.pathVideo == null
                                            ? 'Subir video'
                                            : 'Video cargado',
                                      ),
                                      Icon(
                                        state.pathVideo == null
                                            ? Icons.add
                                            : Icons.close,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (state.pathVideo != null && controller != null)
                        controller!.value.isInitialized
                            ? Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: controller!.value.aspectRatio,
                                    child: VideoPlayer(
                                      controller!,
                                    ),
                                  ),
                                  // play and pause
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        controller!.value.isPlaying
                                            ? controller!.pause()
                                            : controller!.play();
                                      });
                                    },
                                    icon: Icon(
                                      controller!.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _button(BuildContext context) {
    return BlocBuilder<AddVideoCubit, AddVideoState>(
      bloc: cubit,
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomElevatedButton(
            expaned: true,
            onPressed: state.pathVideo == null ||
                    state.titleVideo.isEmpty ||
                    state.descriptionVideo.isEmpty
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    cubit.send();
                  },
            text: 'Publicar',
          ),
        );
      },
    );
  }
}
