import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class LoginEndpoint extends EndpointConfig {
  LoginEndpoint({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  Method get method => Method.post;

  @override
  Map<String, String> get headers => {
        ...Environment.network.headersLanguage,
      };

  @override
  Map<String, String> get body => {
        'email': email,
        'password': password,
      };

  @override
  String get path => 'api/auth/login';
}
