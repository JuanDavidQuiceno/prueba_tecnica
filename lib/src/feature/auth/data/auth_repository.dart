import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/auth/data/endpoint/login_endpoint.dart';
import 'package:prueba_tecnica/src/feature/auth/data/endpoint/register_endpoint.dart';
import 'package:prueba_tecnica/src/feature/auth/data/endpoint/validate_endpoint.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/interfaces/i_auth_repository.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/models/register_model.dart';

class AuthRepository extends IAuthRepository {
  final api = ApiSdk();
  @override
  Future<ResponseApiSdk> validate() {
    return api.run(endpoint: ValidateEndpoint());
  }

  @override
  Future<ResponseApiSdk> login({
    required String email,
    required String password,
  }) {
    return api.run(
      endpoint: LoginEndpoint(email: email, password: password),
    );
  }

  @override
  Future<ResponseApiSdk> register({required RegisterModel model}) {
    return api.run(
      endpoint: RegisterEndpoint(model: model),
    );
  }
}
