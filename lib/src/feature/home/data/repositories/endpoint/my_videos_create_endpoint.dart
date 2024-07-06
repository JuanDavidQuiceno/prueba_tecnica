import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class MyVideosCreateEndpoint extends EndpointConfig {
  MyVideosCreateEndpoint({
    required this.title,
    required this.description,
    required this.pathVideo,
  });

  final String title;
  final String description;
  final String pathVideo;

  @override
  Method get method => Method.post;

  @override
  Map<String, String> get headers => {
        // agregamos los headers genericos de la aplicacion
        ...Environment.network.headers,
      };

  @override
  Map<String, dynamic> get body => {
        'title': title,
        'description': description,
      };

  @override
  List<ImagesModelEndpoint> get files => [
        ImagesModelEndpoint(
          key: 'video',
          path: pathVideo,
        ),
      ];

  @override
  String get path => 'api/videos';
}
