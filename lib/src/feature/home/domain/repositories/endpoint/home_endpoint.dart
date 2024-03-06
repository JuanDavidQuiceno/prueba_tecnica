import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class HomeEndpoint extends EndpointConfig {
  @override
  Method get method => Method.get;

  @override
  Map<String, String> get headers => {
        // agregamos los headers genericos de la aplicacion
        ...Environment.network.headers,
      };

  @override
  String get path => 'v1/breeds';
}
