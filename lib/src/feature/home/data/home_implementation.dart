import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/endpoint/detail_book_endpoint.dart';

import 'package:prueba_tecnica/src/feature/home/data/repositories/endpoint/new_book_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/endpoint/search_book_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/home_repository.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/detail_book_mock.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/new_book_mock.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/search_book_mock.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class HomeImplementation extends BooksRepository {
  HomeImplementation({required this.apiSdk});
  final ApiSdk apiSdk;

  @override
  Future<ResponseApiSdk> getNew() async {
    if (Environment.isMock) {
      await Future.delayed(const Duration(seconds: 2), () {
        return newBookResponseSuccessMock;
      });
    }
    return apiSdk.run(endpoint: NewEndpoint());
  }

  @override
  Future<ResponseApiSdk> getDetail(String id) async {
    if (Environment.isMock) {
      await Future.delayed(const Duration(seconds: 2), () {
        return detailBookResponseSuccessMock;
      });
    }
    return apiSdk.run(endpoint: DetailBookEndpoint(id: id));
  }

  @override
  Future<ResponseApiSdk> searchBook(String query) async {
    if (Environment.isMock) {
      await Future.delayed(const Duration(seconds: 2), () {
        return searchBookResponseSuccessMock;
      });
    }
    return apiSdk.run(endpoint: SearchBookEndpoint(query: query));
  }
}
