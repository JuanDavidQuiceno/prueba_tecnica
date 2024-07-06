import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/feature/errors/widgets/no_data.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/widgets/video_card.dart';
import 'package:prueba_tecnica/src/feature/home/state/videos/videos_cubit.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late VideosCubit cubit;
  @override
  void initState() {
    cubit = VideosCubit()..getVideos();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'Videos',
          child: Text(
            ' Videos',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: BlocBuilder<VideosCubit, VideosState>(
        bloc: cubit,
        builder: (_, state) {
          if (state is VideosLoadingState || state is VideosInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is VideosErrorState) {
            return NoData(
              message: 'No hay videos',
              buttonText: 'Intentar de nuevo',
              onPressed: () {
                cubit.getVideos();
              },
            );
          }
          return ListView.builder(
            itemCount: state.videos.length,
            itemBuilder: (_, index) {
              final video = state.videos[index];
              return VideoCard(model: video);
            },
          );
        },
      ),
    );
  }
}
