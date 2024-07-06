import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/video_model.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.model,
    this.onPressedDelete,
    super.key,
  });
  final VideoModel model;
  final void Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(model.title),
            subtitle: Text(model.description),
            trailing: onPressedDelete != null
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onPressedDelete,
                  )
                : null,
          ),
          // TODO: add video player
        ],
      ),
    );
  }
}
