// ignore_for_file: lines_longer_than_80_chars
// final validateNitMock = {
//   'data': {
//     '_id': '1',
//     'nombre': 'Distribuidor 1',
//     'logo': 'https://via.placeholder.com/150',
//     'nit_cc': '123456789',
//   },
// };
import 'package:api_sdk/api_sdk.dart';

final ResponseApiSdk detailBookResponseSuccessMock = ResponseApiSdk(
  statusCode: 200,
  body: deatilBooksMock,
);
final ResponseApiSdk detailBookResponseErrorMock = ResponseApiSdk(
  statusCode: 204,
  // ignore: inference_failure_on_collection_literal
  body: {},
);

final deatilBooksMock = {
  'error': '0',
  'title': 'Securing DevOps',
  'subtitle': 'Security in the Cloud',
  'authors': 'Julien Vehent',
  'publisher': 'Manning',
  'language': 'English',
  'isbn10': '1617294136',
  'isbn13': '9781617294136',
  'pages': '384',
  'year': '2018',
  'rating': '4',
  'desc':
      'An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team&#039;s highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your c...',
  'price': r'$39.65',
  'image': 'https://itbook.store/img/books/9781617294136.png',
  'url': 'https://itbook.store/books/9781617294136',
  'pdf': {
    'Chapter 2': 'https://itbook.store/files/9781617294136/chapter2.pdf',
    'Chapter 5': 'https://itbook.store/files/9781617294136/chapter5.pdf',
  },
};
