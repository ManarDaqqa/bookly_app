import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber =0}) async {

    List<BookEntity> booksList;
    try{

      booksList = homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber
      );
      if(booksList.isNotEmpty){
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber
      );
      return right(booksList);

    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{

    List<BookEntity> newestBooksList;

    try{
      newestBooksList = homeLocalDataSource.fetchNewestBooks();
      if(newestBooksList.isNotEmpty){
        return right(newestBooksList);
      }
      newestBooksList = await homeRemoteDataSource.fetchNewestBooks();
      return right(newestBooksList);

    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
