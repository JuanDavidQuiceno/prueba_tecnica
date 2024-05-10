import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class SearchBookEndpoint extends EndpointConfig {
  SearchBookEndpoint({required this.query});
  final String query;
  @override
  Method get method => Method.get;

  @override
  Map<String, String> get headers => {
        // agregamos los headers genericos de la aplicacion
        ...Environment.network.headers,
      };

  @override
  String get path => '/1.0/search/$query';
}
