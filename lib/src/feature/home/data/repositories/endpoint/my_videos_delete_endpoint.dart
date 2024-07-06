import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class MyVideosDeleteEndpoint extends EndpointConfig {
  MyVideosDeleteEndpoint({required this.id});

  final int id;

  @override
  Method get method => Method.delete;

  @override
  Map<String, String> get headers => {
        // agregamos los headers genericos de la aplicacion
        ...Environment.network.headers,
      };

  @override
  String get path => 'api/videos/$id';
}
