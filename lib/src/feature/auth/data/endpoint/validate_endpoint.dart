import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class ValidateEndpoint extends EndpointConfig {
  @override
  Method get method => Method.get;

  @override
  Map<String, String> get headers => {
        ...Environment.network.headersLanguage,
      };

  @override
  String get path => 'api/auth';
}
