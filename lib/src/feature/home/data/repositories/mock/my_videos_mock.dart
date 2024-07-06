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

final ResponseApiSdk getMyVideosSuccessMock = ResponseApiSdk(
  statusCode: 200,
  body: getMyVideosMock,
);
final ResponseApiSdk getMyVideosErrorMock = ResponseApiSdk(
  statusCode: 204,
  // ignore: inference_failure_on_collection_literal
  body: {},
);

final getMyVideosMock = {
  'message': 'success',
  'data': {
    'result': {
      'count': 10,
      'rows': [
        {
          'id': 1,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:15:00.000Z',
        },
        {
          'id': 2,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:21:17.000Z',
        },
        {
          'id': 3,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:27:20.000Z',
        },
        {
          'id': 4,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:30:48.000Z',
        },
        {
          'id': 5,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:32:18.000Z',
        },
        {
          'id': 6,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:34:13.000Z',
        },
        {
          'id': 7,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url':
              'https://igoo-dev.s3.us-east-2.amazonaws.com/videos/1720071436316-pruebavideo.mp4',
          'created_at': '2024-07-04T05:37:21.000Z',
        },
        {
          'id': 8,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url':
              'https://igoo-dev.s3.us-east-2.amazonaws.com/videos/1720071485340-pruebavideo.mp4',
          'created_at': '2024-07-04T05:38:07.000Z',
        },
        {
          'id': 9,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url': null,
          'created_at': '2024-07-04T05:39:40.000Z',
        },
        {
          'id': 10,
          'user_id': 1,
          'title': 'Prueba titulo',
          'description': 'prueba descripcion',
          'url':
              'https://igoo-dev.s3.us-east-2.amazonaws.com/videos/1720071713741-pruebavideo.mp4',
          'created_at': '2024-07-04T05:41:56.000Z',
        }
      ],
    },
    'meta': {'total': 10, 'page': 1},
  },
  'error': false,
};
