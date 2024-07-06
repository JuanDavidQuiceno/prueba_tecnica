import 'package:api_sdk/api_sdk.dart';

abstract class IAuthRepository {
  Future<ResponseApiSdk> auth();
}
