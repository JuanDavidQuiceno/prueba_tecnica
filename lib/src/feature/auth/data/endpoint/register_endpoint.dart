import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/models/register_model.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class RegisterEndpoint extends EndpointConfig {
  RegisterEndpoint({
    required this.model,
  });
  final RegisterModel model;

  @override
  Method get method => Method.post;

  @override
  Map<String, String> get headers => {
        ...Environment.network.headersLanguage,
      };

  @override
  Map<String, String> get body => {
        'name': model.name,
        'last_name': model.lastName,
        'email': model.email,
        'password': model.password,
        'phone': model.phone,
      };

  @override
  String get path => 'api/auth/register';
}
