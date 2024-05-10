import 'package:api_sdk/api_sdk.dart';

final ResponseApiSdk searchBookResponseSuccessMock = ResponseApiSdk(
  statusCode: 200,
  body: searchBooksMock,
);
final ResponseApiSdk searchBookResponseErrorMock = ResponseApiSdk(
  statusCode: 204,
  // ignore: inference_failure_on_collection_literal
  body: {},
);

final searchBooksMock = {
  'error': '0',
  'total': '80',
  'page': '1',
  'books': [
    {
      'title': 'MongoDB in Action, 2nd Edition',
      'subtitle': 'Covers MongoDB version 3.0',
      'isbn13': '9781617291609',
      'price': r'$19.99',
      'image': 'https://itbook.store/img/books/9781617291609.png',
      'url': 'https://itbook.store/books/9781617291609',
    },
    {
      'title': 'MongoDB and Python',
      'subtitle':
          'Patterns and processes for the popular document-oriented database',
      'isbn13': '9781449310370',
      'price': r'$6.88',
      'image': 'https://itbook.store/img/books/9781449310370.png',
      'url': 'https://itbook.store/books/9781449310370',
    },
    {
      'title': 'Building Node Applications with MongoDB and Backbone',
      'subtitle': 'Rapid Prototyping and Scalable Deployment',
      'isbn13': '9781449337391',
      'price': r'$4.85',
      'image': 'https://itbook.store/img/books/9781449337391.png',
      'url': 'https://itbook.store/books/9781449337391',
    },
    {
      'title': 'Practical MongoDB',
      'subtitle': 'Architecting, Developing, and Administering MongoDB',
      'isbn13': '9781484206485',
      'price': r'$41.65',
      'image': 'https://itbook.store/img/books/9781484206485.png',
      'url': 'https://itbook.store/books/9781484206485',
    },
    {
      'title': 'The Definitive Guide to MongoDB, 3rd Edition',
      'subtitle': 'A complete guide to dealing with Big Data using MongoDB',
      'isbn13': '9781484211830',
      'price': r'$49.99',
      'image': 'https://itbook.store/img/books/9781484211830.png',
      'url': 'https://itbook.store/books/9781484211830',
    },
    {
      'title': 'MongoDB Performance Tuning',
      'subtitle': 'Optimizing MongoDB Databases and their Applications',
      'isbn13': '9781484268780',
      'price': r'$34.74',
      'image': 'https://itbook.store/img/books/9781484268780.png',
      'url': 'https://itbook.store/books/9781484268780',
    },
    {
      'title':
          'Getting MEAN with Mongo, Express, Angular, and Node, 2nd Edition',
      'subtitle': '',
      'isbn13': '9781617294754',
      'price': r'$38.99',
      'image': 'https://itbook.store/img/books/9781617294754.png',
      'url': 'https://itbook.store/books/9781617294754',
    },
    {
      'title': 'Mongoose for Application Development',
      'subtitle':
          'Learn to speed up your application development by using Mongoose to harness the power of Node.js and MongoDB',
      'isbn13': '9781782168195',
      'price': r'$23.99',
      'image': 'https://itbook.store/img/books/9781782168195.png',
      'url': 'https://itbook.store/books/9781782168195',
    },
    {
      'title': 'Pentaho Analytics for MongoDB',
      'subtitle':
          'Combine Pentaho Analytics and MongoDB to create powerful analysis and reporting solutions',
      'isbn13': '9781782168355',
      'price': r'$16.99',
      'image': 'https://itbook.store/img/books/9781782168355.png',
      'url': 'https://itbook.store/books/9781782168355',
    },
    {
      'title': 'Pentaho Analytics for MongoDB Cookbook',
      'subtitle':
          'Over 50 recipes to learn how to use Pentaho Analytics and MongoDB to create powerful analysis and reporting solutions',
      'isbn13': '9781783553273',
      'price': r'$44.99',
      'image': 'https://itbook.store/img/books/9781783553273.png',
      'url': 'https://itbook.store/books/9781783553273',
    }
  ],
};
