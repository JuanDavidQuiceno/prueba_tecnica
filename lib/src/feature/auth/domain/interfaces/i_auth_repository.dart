import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/models/register_model.dart';

abstract class IAuthRepository {
  Future<ResponseApiSdk> validate();
  Future<ResponseApiSdk> login({
    required String email,
    required String password,
  });
  Future<ResponseApiSdk> register({required RegisterModel model});
}
