import 'package:api_sdk/api_sdk.dart';

abstract class BooksRepository {
  Future<ResponseApiSdk> videos();
  Future<ResponseApiSdk> myVideos();
}
