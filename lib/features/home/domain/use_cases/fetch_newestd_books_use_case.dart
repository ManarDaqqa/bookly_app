import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/no_parametar_use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewestdBooksUseCase extends UseCase<List<BookEntity>>{

  final HomeRepo homeRepo;

  FetchNewestdBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async{
    // TODO: implement call
    return homeRepo.fetchNewestBooks();
  }

}

