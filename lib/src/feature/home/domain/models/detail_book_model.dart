// To parse this JSON data, do
//
//     final detailBooksModel = detailBooksModelFromJson(jsonString);

import 'dart:convert';

DetailBooksModel detailBooksModelFromJson(String str) =>
    DetailBooksModel.fromJson(json.decode(str) as Map<String, dynamic>);

String detailBooksModelToJson(DetailBooksModel data) =>
    json.encode(data.toJson());

class DetailBooksModel {
  DetailBooksModel({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    required this.pdf,
  });

  factory DetailBooksModel.fromJson(Map<String, dynamic> json) =>
      DetailBooksModel(
        error: json['error'] != null ? json['error'].toString() : '',
        title: json['title'] != null ? json['title'].toString() : '',
        subtitle: json['subtitle'] != null ? json['subtitle'].toString() : '',
        authors: json['authors'] != null ? json['authors'].toString() : '',
        publisher:
            json['publisher'] != null ? json['publisher'].toString() : '',
        language: json['language'] != null ? json['language'].toString() : '',
        isbn10: json['isbn10'] != null ? json['isbn10'].toString() : '',
        isbn13: json['isbn13'] != null ? json['isbn13'].toString() : '',
        pages: json['pages'] != null ? json['pages'].toString() : '',
        year: json['year'] != null ? json['year'].toString() : '',
        rating: json['rating'] != null ? json['rating'].toString() : '',
        desc: json['desc'] != null ? json['desc'].toString() : '',
        price: json['price'] != null ? json['price'].toString() : '',
        image: json['image'] != null ? json['image'].toString() : '',
        url: json['url'] != null ? json['url'].toString() : '',
        pdf: json['pdf'] != null
            ? PdfModel.fromJson(json['pdf'] as Map<String, dynamic>)
            : PdfModel.fromJson({}),
      );
  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  String pages;
  String year;
  String rating;
  String desc;
  String price;
  String image;
  String url;
  PdfModel pdf;

  DetailBooksModel copyWith({
    String? error,
    String? title,
    String? subtitle,
    String? authors,
    String? publisher,
    String? language,
    String? isbn10,
    String? isbn13,
    String? pages,
    String? year,
    String? rating,
    String? desc,
    String? price,
    String? image,
    String? url,
    PdfModel? pdf,
  }) =>
      DetailBooksModel(
        error: error ?? this.error,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        authors: authors ?? this.authors,
        publisher: publisher ?? this.publisher,
        language: language ?? this.language,
        isbn10: isbn10 ?? this.isbn10,
        isbn13: isbn13 ?? this.isbn13,
        pages: pages ?? this.pages,
        year: year ?? this.year,
        rating: rating ?? this.rating,
        desc: desc ?? this.desc,
        price: price ?? this.price,
        image: image ?? this.image,
        url: url ?? this.url,
        pdf: pdf ?? this.pdf,
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'language': language,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'pages': pages,
        'year': year,
        'rating': rating,
        'desc': desc,
        'price': price,
        'image': image,
        'url': url,
        'pdf': pdf.toJson(),
      };
}

class PdfModel {
  PdfModel({
    required this.chapter2,
    required this.chapter5,
  });

  factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
        chapter2: json['Chapter 2'] != null ? json['Chapter 2'].toString() : '',
        chapter5: json['Chapter 5'] != null ? json['Chapter 5'].toString() : '',
      );
  String chapter2;
  String chapter5;

  PdfModel copyWith({
    String? chapter2,
    String? chapter5,
  }) =>
      PdfModel(
        chapter2: chapter2 ?? this.chapter2,
        chapter5: chapter5 ?? this.chapter5,
      );

  Map<String, dynamic> toJson() => {
        'Chapter 2': chapter2,
        'Chapter 5': chapter5,
      };
}
