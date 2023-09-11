import 'package:bookly/features/home/data/models/sale_info.dart';
import 'package:bookly/features/home/data/models/search_info.dart';
import 'package:bookly/features/home/data/models/volume_info.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'access_info.dart';

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo}) : super(bookId: id!,
      image: volumeInfo!.imageLinks?.thumbnail ?? 'https://i.pinimg.com/564x/cd/61/c4/cd61c4d471cd21830ef6819b13655cd9.jpg',
      authorName: volumeInfo.authors?.first ?? 'No name',
      price: 0.0,
      rating: volumeInfo.averageRating,
      title: volumeInfo.title!,);

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      BookModel(
        kind: json['kind'] as String,
        id: json['id'] as String,
        etag: json['etag'] as String,
        selfLink: json['selfLink'] as String,
        volumeInfo: json['volumeInfo'] != null
            ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
            : null,
        saleInfo: json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
            : null,
        accessInfo: json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
            : null,
        searchInfo: json['searchInfo'] != null
            ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
            : null,
      );

}













