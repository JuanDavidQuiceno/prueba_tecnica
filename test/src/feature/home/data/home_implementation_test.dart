// // ignore_for_file: inference_failure_on_collection_literal

// import 'package:api_sdk/api_sdk.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:prueba_tecnica/src/feature/home/domain/interfaces/i_home_repository.dart';
// import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/detail_book_mock.dart';
// import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/my_videos_mock.dart';
// import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/videos_mock.dart';

// import 'home_implementation_test.mocks.dart';

// @GenerateNiceMocks(
//   <MockSpec<dynamic>>[
//     MockSpec<BooksRepository>(as: #BooksRepositoryMock),
//   ],
// )
// void main() {
//   group('YourTestGroupName', () {
//     test('New books', () async {
//       final booksRepository = BooksRepositoryMock();
//       when(booksRepository.getNew()).thenAnswer(
//         (_) async => newBookResponseSuccessMock,
//       );
//       final response = await booksRepository.getNew();
//       expect(response, isA<ResponseApiSdk>());
//       if (response.statusCode == 200) {
//         expect(response.body, newBooksMock);
//       } else if (response.statusCode == 204) {
//         expect(response.body, {});
//       }
//       // expect(registerRepository.validateNit, isA<ResponseApiSdk>());
//     });
//     test('Detalle del libro', () async {
//       final booksRepository = BooksRepositoryMock();
//       when(booksRepository.getDetail('9781617294136')).thenAnswer(
//         (_) async => detailBookResponseSuccessMock,
//       );
//       final response = await booksRepository.getDetail('9781617294136');
//       expect(response, isA<ResponseApiSdk>());
//       if (response.statusCode == 200) {
//         expect(response.body, deatilBooksMock);
//       } else if (response.statusCode == 204) {
//         expect(response.body, {});
//       }
//       // expect(registerRepository.validateNit, isA<ResponseApiSdk>());
//     });

//     test('Busqueda de libros', () async {
//       final booksRepository = BooksRepositoryMock();
//       when(booksRepository.searchBook('mongo')).thenAnswer(
//         (_) async => searchBookResponseSuccessMock,
//       );
//       final response = await booksRepository.searchBook('mongo');
//       expect(response, isA<ResponseApiSdk>());
//       if (response.statusCode == 200) {
//         expect(response.body, searchBooksMock);
//       } else if (response.statusCode == 204) {
//         expect(response.body, {});
//       }
//       // expect(registerRepository.validateNit, isA<ResponseApiSdk>());
//     });
//   });
// }
