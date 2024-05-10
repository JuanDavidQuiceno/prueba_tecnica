import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/home/domain/repositories/endpoint/detail_book_endpoint.dart';

import 'package:prueba_tecnica/src/feature/home/domain/repositories/endpoint/new_book_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/domain/repositories/endpoint/search_book_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/domain/repositories/home_repository.dart';

class HomeImplementation extends BooksRepository {
  HomeImplementation({required this.apiSdk});
  final ApiSdk apiSdk;

  @override
  Future<ResponseApiSdk> getNew() async {
    return apiSdk.run(endpoint: NewEndpoint());
  }

  @override
  Future<ResponseApiSdk> getDetail(String id) {
    return apiSdk.run(endpoint: DetailBookEndpoint(id: id));
  }

  @override
  Future<ResponseApiSdk> searchBook(String query) {
    return apiSdk.run(endpoint: SearchBookEndpoint(query: query));
  }
}
