import 'package:api_sdk/api_sdk.dart';

abstract class IHomeRepository {
  Future<ResponseApiSdk> videos();
  Future<ResponseApiSdk> myVideos();
}
