import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/common/repository/endpoints/auth_endpoint.dart';
import 'package:prueba_tecnica/src/common/repository/interfaces/i_auth_repository.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/videos_mock.dart';

import 'package:prueba_tecnica/src/utils/environment.dart';

class AuthRepository extends IAuthRepository {
  final apiSdk = ApiSdk();

  @override
  Future<ResponseApiSdk> auth() async {
    if (Environment.isMock) {
      await Future.delayed(const Duration(seconds: 2), () {
        return getVideosSuccessMock;
      });
    }
    return apiSdk.run(endpoint: AuthEndpoint());
  }
}
