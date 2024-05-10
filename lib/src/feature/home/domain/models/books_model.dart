// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

import 'package:prueba_tecnica/src/feature/home/domain/models/detail_book_model.dart';

BooksModel booksModelFromJson(String str) =>
    BooksModel.fromJson(json.decode(str) as Map<String, dynamic>);

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
  BooksModel({
    required this.error,
    required this.total,
    required this.books,
  });
  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        error: json['error'] != null
            ? int.tryParse(json['error'].toString()) ?? 0
            : 0,
        total: json['total'] != null
            ? int.tryParse(json['total'].toString()) ?? 0
            : 0,
        books: List<BookModel>.from(
          (json['books'] as List)
              .map((x) => BookModel.fromJson(x as Map<String, dynamic>)),
        ),
      );
  int error;
  int total;
  List<BookModel> books;

  BooksModel copyWith({
    int? error,
    int? total,
    List<BookModel>? books,
  }) =>
      BooksModel(
        error: error ?? this.error,
        total: total ?? this.total,
        books: books ?? this.books,
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'total': total,
        'books': List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class BookModel {
  BookModel({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
    this.detailBooksModel,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json['title'] != null ? json['title'].toString() : '',
        subtitle: json['subtitle'] != null ? json['subtitle'].toString() : '',
        isbn13: json['isbn13'] != null ? json['isbn13'].toString() : '',
        price: json['price'] != null ? json['price'].toString() : '',
        image: json['image'] != null ? json['image'].toString() : '',
        url: json['url'] != null ? json['url'].toString() : '',
        detailBooksModel: json['detailBooksModel'] != null
            ? DetailBooksModel.fromJson(
                json['detailBooksModel'] as Map<String, dynamic>,
              )
            : null,
      );
  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;
  DetailBooksModel? detailBooksModel;

  BookModel copyWith({
    String? title,
    String? subtitle,
    String? isbn13,
    String? price,
    String? image,
    String? url,
  }) =>
      BookModel(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        isbn13: isbn13 ?? this.isbn13,
        price: price ?? this.price,
        image: image ?? this.image,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'isbn13': isbn13,
        'price': price,
        'image': image,
        'url': url,
        'detailBooksModel': detailBooksModel?.toJson(),
      };
}
