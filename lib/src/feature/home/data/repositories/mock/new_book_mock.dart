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

final ResponseApiSdk newBookResponseSuccessMock = ResponseApiSdk(
  statusCode: 200,
  body: newBooksMock,
);
final ResponseApiSdk newBookResponseErrorMock = ResponseApiSdk(
  statusCode: 204,
  // ignore: inference_failure_on_collection_literal
  body: {},
);

final newBooksMock = {
  'error': '0',
  'total': '20',
  'books': [
    {
      'title': 'An Introduction to C & GUI Programming, 2nd Edition',
      'subtitle': '',
      'isbn13': '9781912047451',
      'price': r'$14.92',
      'image': 'https://itbook.store/img/books/9781912047451.png',
      'url': 'https://itbook.store/books/9781912047451',
    },
    {
      'title': 'Snowflake: The Definitive Guide',
      'subtitle':
          'Architecting, Designing, and Deploying on the Snowflake Data Cloud',
      'isbn13': '9781098103828',
      'price': r'$58.90',
      'image': 'https://itbook.store/img/books/9781098103828.png',
      'url': 'https://itbook.store/books/9781098103828',
    },
    {
      'title': 'Python for Data Analysis, 3rd Edition',
      'subtitle': 'Data Wrangling with pandas, NumPy, and Jupyter',
      'isbn13': '9781098104030',
      'price': r'$36.18',
      'image': 'https://itbook.store/img/books/9781098104030.png',
      'url': 'https://itbook.store/books/9781098104030',
    },
    {
      'title': 'Reliable Machine Learning',
      'subtitle': 'Applying SRE Principles to ML in Production',
      'isbn13': '9781098106225',
      'price': r'$43.99',
      'image': 'https://itbook.store/img/books/9781098106225.png',
      'url': 'https://itbook.store/books/9781098106225',
    },
    {
      'title': 'Data Visualization with Python and JavaScript, 2nd Edition',
      'subtitle': 'Scrape, Clean, Explore, and Transform Your Data',
      'isbn13': '9781098111878',
      'price': r'$60.99',
      'image': 'https://itbook.store/img/books/9781098111878.png',
      'url': 'https://itbook.store/books/9781098111878',
    },
    {
      'title': 'Learning Microsoft Power BI',
      'subtitle': 'Transforming Data into Insights',
      'isbn13': '9781098112844',
      'price': r'$40.46',
      'image': 'https://itbook.store/img/books/9781098112844.png',
      'url': 'https://itbook.store/books/9781098112844',
    },
    {
      'title': 'C++ Software Design',
      'subtitle': 'Design Principles and Patterns for High-Quality Software',
      'isbn13': '9781098113162',
      'price': r'$47.03',
      'image': 'https://itbook.store/img/books/9781098113162.png',
      'url': 'https://itbook.store/books/9781098113162',
    },
    {
      'title': 'Terraform: Up and Running, 3rd Edition',
      'subtitle': 'Writing Infrastructure as Code',
      'isbn13': '9781098116743',
      'price': r'$41.99',
      'image': 'https://itbook.store/img/books/9781098116743.png',
      'url': 'https://itbook.store/books/9781098116743',
    },
    {
      'title': 'Flutter and Dart Cookbook',
      'subtitle': 'Developing Full-Stack Applications for the Cloud',
      'isbn13': '9781098119515',
      'price': r'$50.52',
      'image': 'https://itbook.store/img/books/9781098119515.png',
      'url': 'https://itbook.store/books/9781098119515',
    },
    {
      'title': 'Python Data Science Handbook, 2nd Edition',
      'subtitle': 'Essential Tools for Working with Data',
      'isbn13': '9781098121228',
      'price': r'$56.16',
      'image': 'https://itbook.store/img/books/9781098121228.png',
      'url': 'https://itbook.store/books/9781098121228',
    },
    {
      'title': 'Raspberry Pi Cookbook, 4th Edition',
      'subtitle': 'Software and Hardware Problems and Solutions',
      'isbn13': '9781098130923',
      'price': r'$14.99',
      'image': 'https://itbook.store/img/books/9781098130923.png',
      'url': 'https://itbook.store/books/9781098130923',
    },
    {
      'title': 'Azure Maps Using Blazor Succinctly',
      'subtitle': '',
      'isbn13': '9781642002263',
      'price': r'$0.00',
      'image': 'https://itbook.store/img/books/9781642002263.png',
      'url': 'https://itbook.store/books/9781642002263',
    },
    {
      'title': 'Full Stack Quarkus and React',
      'subtitle':
          'Hands-on full stack web development with Java, React, and Kubernetes',
      'isbn13': '9781800562738',
      'price': r'$39.99',
      'image': 'https://itbook.store/img/books/9781800562738.png',
      'url': 'https://itbook.store/books/9781800562738',
    },
    {
      'title': 'Mathematics for Game Programming and Computer Graphics',
      'subtitle':
          'Explore the essential mathematics for creating, rendering, and manipulating 3D virtual environments',
      'isbn13': '9781801077330',
      'price': r'$49.99',
      'image': 'https://itbook.store/img/books/9781801077330.png',
      'url': 'https://itbook.store/books/9781801077330',
    },
    {
      'title': 'Architecting and Building High-Speed SoCs',
      'subtitle':
          'Design, develop, and debug complex FPGA-based systems-on-chip',
      'isbn13': '9781801810999',
      'price': r'$32.99',
      'image': 'https://itbook.store/img/books/9781801810999.png',
      'url': 'https://itbook.store/books/9781801810999',
    },
    {
      'title': 'Web Development with Julia and Genie',
      'subtitle':
          'A hands-on guide to high-performance server-side web development with the Julia programming language',
      'isbn13': '9781801811132',
      'price': r'$39.99',
      'image': 'https://itbook.store/img/books/9781801811132.png',
      'url': 'https://itbook.store/books/9781801811132',
    },
    {
      'title': 'Java Memory Management',
      'subtitle': 'A comprehensive guide to garbage collection and JVM tuning',
      'isbn13': '9781801812856',
      'price': r'$34.99',
      'image': 'https://itbook.store/img/books/9781801812856.png',
      'url': 'https://itbook.store/books/9781801812856',
    },
    {
      'title': 'Test-Driven Development with C++',
      'subtitle': 'A simple guide to writing bug-free Agile code',
      'isbn13': '9781803242002',
      'price': r'$44.99',
      'image': 'https://itbook.store/img/books/9781803242002.png',
      'url': 'https://itbook.store/books/9781803242002',
    },
    {
      'title': 'Software Test Design',
      'subtitle':
          'Write comprehensive test plans to uncover critical bugs in web, desktop, and mobile apps',
      'isbn13': '9781804612569',
      'price': r'$44.99',
      'image': 'https://itbook.store/img/books/9781804612569.png',
      'url': 'https://itbook.store/books/9781804612569',
    },
    {
      'title': 'Microservices with Go',
      'subtitle': 'Building scalable and reliable microservices with Go',
      'isbn13': '9781804617007',
      'price': r'$29.99',
      'image': 'https://itbook.store/img/books/9781804617007.png',
      'url': 'https://itbook.store/books/9781804617007',
    }
  ],
};
