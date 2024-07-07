import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/common/bloc/video_controller/video_controller_cubit.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/video_model.dart';
import 'package:prueba_tecnica/src/global_locator.dart';
import 'package:video_player/video_player.dart';

class VideoController extends StatefulWidget {
  const VideoController({required this.model, super.key});
  final VideoModel model;

  @override
  State<VideoController> createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.contentUri(
      Uri.parse(widget.model.url),
    )..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(
            controller,
          ),
        ),
        // play and pause
        BlocConsumer<VideoControllerCubit, VideoControllerState>(
          bloc: global<VideoControllerCubit>(),
          listener: (_, state) {
            // si el statdo es playing y el id del video es igual al id del en
            // el widget, entonces se reproduce el video
            if (state is VideoControllerPlaying &&
                state.model.id == widget.model.id) {
              controller.play();
            } else {
              // en caso contrario se pausan todos los videos
              controller.pause();
            }
          },
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                controller.value.isPlaying
                    ? global<VideoControllerCubit>().pause()
                    : global<VideoControllerCubit>().play(widget.model);
              },
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            );
          },
        ),
      ],
    );
  }
}
