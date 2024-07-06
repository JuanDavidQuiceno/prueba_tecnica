import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/feature/errors/widgets/no_data.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/widgets/video_card.dart';
import 'package:prueba_tecnica/src/feature/home/state/my_videos/my_videos_cubit.dart';
import 'package:prueba_tecnica/src/feature/widgets/alerts/custom_alerts.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_loading.dart';

class MyVideosScreen extends StatefulWidget {
  const MyVideosScreen({super.key});

  @override
  State<MyVideosScreen> createState() => _MyVideosScreenState();
}

class _MyVideosScreenState extends State<MyVideosScreen> {
  late MyVideosCubit cubit;
  @override
  void initState() {
    cubit = MyVideosCubit()..getVideos();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Hero(
              tag: 'My Videos',
              child: Text(
                'My Videos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          body: _content(context),
        ),
        BlocConsumer<MyVideosCubit, MyVideosState>(
          bloc: cubit,
          listener: (_, state) {
            if (state is MyVideosMessageState) {
              CustomAlert.alertDialog(
                context,
                type: state.type,
                title: state.title,
                message: state.message,
              );
            }
          },
          builder: (_, state) {
            if (state is MyVideosLoadingState) {
              return const CustomLoading();
            }
            return const SizedBox();
          },
        )
      ],
    );
  }

  Widget _content(BuildContext context) {
    return BlocBuilder<MyVideosCubit, MyVideosState>(
      bloc: cubit,
      builder: (_, state) {
        if (state is MyVideosLoadingDataState || state is MyVideosInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MyVideosErrorState) {
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
            return VideoCard(
              model: video,
              onPressedDelete: () {
                cubit.deleteVideo(video.id);
              },
            );
          },
        );
      },
    );
  }
}
