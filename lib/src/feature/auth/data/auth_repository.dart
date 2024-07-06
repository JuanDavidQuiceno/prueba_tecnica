import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/common/bloc/auth/auth_bloc.dart';
import 'package:prueba_tecnica/src/common/services/local_storage.dart';
import 'package:prueba_tecnica/src/feature/auth/data/endpoint/login_endpoint.dart';
import 'package:prueba_tecnica/src/feature/auth/data/endpoint/register_endpoint.dart';
import 'package:prueba_tecnica/src/feature/auth/data/endpoint/validate_endpoint.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/interfaces/i_auth_repository.dart';
import 'package:prueba_tecnica/src/feature/auth/domain/models/register_model.dart';
import 'package:prueba_tecnica/src/global_locator.dart';

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
  }) async {
    // return api.run(
    //   endpoint: LoginEndpoint(email: email, password: password),
    // );
    final response = await api.run(
      endpoint: LoginEndpoint(email: email, password: password),
    );
    // final body = response.body as Map<String, dynamic>;
    // asignamos los datos requeridos
    if (response.statusCode == 200) {
      // verificamos que el token llegue el los headers
      if (response.headers!.containsKey('authorization')) {
        LocalStorage.token = response.headers!['authorization'].toString();
        // evento para asignarlos datos del usuario
        // TODO enviar modelo de usuario
        // global<AuthBloc>().add(
        //   AuthLoginEvent(
        //       // model: UserModel.fromJson(body['data'] as Map<String, dynamic>),
        //       ),
        // );
      }
    }
    return response;
  }

  @override
  Future<ResponseApiSdk> register({required RegisterModel model}) {
    return api.run(
      endpoint: RegisterEndpoint(model: model),
    );
  }
}
