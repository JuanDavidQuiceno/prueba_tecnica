// ignore_for_file: lines_longer_than_80_chars

import 'package:api_sdk/api_sdk.dart';

final ResponseApiSdk getVideosSuccessMock = ResponseApiSdk(
  statusCode: 200,
  body: videosMock,
);
final ResponseApiSdk getVideosErrorMock = ResponseApiSdk(
  statusCode: 204,
  // ignore: inference_failure_on_collection_literal
  body: {},
);

final videosMock = {
  'result': {
    'count': 9,
    'rows': [
      {
        'id': 2,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url': null,
        'created_at': '2024-07-04T05:21:17.000Z',
      },
      {
        'id': 3,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url': null,
        'created_at': '2024-07-04T05:27:20.000Z',
      },
      {
        'id': 4,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url': null,
        'created_at': '2024-07-04T05:30:48.000Z',
      },
      {
        'id': 5,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url': null,
        'created_at': '2024-07-04T05:32:18.000Z',
      },
      {
        'id': 6,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url': null,
        'created_at': '2024-07-04T05:34:13.000Z',
      },
      {
        'id': 7,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url':
            'https://igoo-dev.s3.us-east-2.amazonaws.com/videos/1720071436316-pruebavideo.mp4',
        'created_at': '2024-07-04T05:37:21.000Z',
      },
      {
        'id': 8,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url':
            'https://igoo-dev.s3.us-east-2.amazonaws.com/videos/1720071485340-pruebavideo.mp4',
        'created_at': '2024-07-04T05:38:07.000Z',
      },
      {
        'id': 9,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url': null,
        'created_at': '2024-07-04T05:39:40.000Z',
      },
      {
        'id': 10,
        'title': 'Prueba titulo',
        'description': 'prueba descripcion',
        'url':
            'https://igoo-dev.s3.us-east-2.amazonaws.com/videos/1720071713741-pruebavideo.mp4',
        'created_at': '2024-07-04T05:41:56.000Z',
      }
    ],
  },
  'meta': {'total': 9, 'page': 1},
};
