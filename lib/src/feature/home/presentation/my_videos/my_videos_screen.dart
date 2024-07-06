import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/feature/errors/widgets/no_data.dart';
import 'package:prueba_tecnica/src/feature/home/state/my_videos/my_videos_cubit.dart';

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
    return Scaffold(
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
      body: BlocBuilder<MyVideosCubit, MyVideosState>(
        bloc: cubit,
        builder: (_, state) {
          if (state is MyVideosLoadingState || state is MyVideosInitial) {
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
              return ListTile(
                title: Text(video.title),
                subtitle: Text(video.description),
              );
            },
          );
        },
      ),
    );
  }
}
