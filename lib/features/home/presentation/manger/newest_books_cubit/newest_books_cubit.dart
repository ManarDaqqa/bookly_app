import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newestd_books_use_case.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestdBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestdBooksUseCase fetchNewestdBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestdBooksUseCase.call();
    result.fold((l) {
      emit(NewestBooksFailure(l.message));
    }, (r) {
      emit(NewestBooksSuccess(r));
    }
    );
  }
}
