import 'package:api_sdk/api_sdk.dart';

abstract class BooksRepository {
  Future<ResponseApiSdk> getNew();
  Future<ResponseApiSdk> getDetail(String id);
  Future<ResponseApiSdk> searchBook(String query);
}
