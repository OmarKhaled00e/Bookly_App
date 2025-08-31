import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBookFailure(failure.errMessage));
      },
      (books) {
        emit(FeaturedBookSuccess(books));
      },
    );
  }
}
