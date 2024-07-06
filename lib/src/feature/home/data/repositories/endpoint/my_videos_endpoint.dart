import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class MyVideosEndpoint extends EndpointConfig {
  @override
  Method get method => Method.get;

  @override
  Map<String, String> get headers => {
        // agregamos los headers genericos de la aplicacion
        ...Environment.network.headers,
      };

  @override
  Map<String, dynamic> get queryParameters => {'page': 1, 'limit': 20};

  @override
  String get path => 'api/videos/me';
}
