import 'package:api_sdk/api_sdk.dart';

abstract class IHomeRepository {
  Future<ResponseApiSdk> videos();
  Future<ResponseApiSdk> myVideos();
  Future<ResponseApiSdk> myVideosCreate({
    required String title,
    required String description,
    required String path,
  });
  Future<ResponseApiSdk> myVideosDelete(int id);
}
