import 'package:bloc/bloc.dart';
import 'package:bookly/Features/search/data/repos/home_repo.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:equatable/equatable.dart';

part 'sarch_book_state.dart';

class SarchBookCubit extends Cubit<SarchBookState> {
  SarchBookCubit(this.homeRepo) : super(SarchBookInitial());
  final HomeRepo homeRepo;

  Future<void> featchSarchBook({required String text}) async {
    emit(SarchBookLoading());
    var result = await homeRepo.fatchSarchBooks(text: text);
    result.fold(
      (failure) {
        emit(SarchBookFailure(failure.errMessage));
      },
      (books) {
        emit(SarchBookSuccess(books));
      },
    );
  }
}
