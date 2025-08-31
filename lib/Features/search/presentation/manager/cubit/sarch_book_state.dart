part of 'sarch_book_cubit.dart';

sealed class SarchBookState extends Equatable {
  const SarchBookState();

  @override
  List<Object> get props => [];
}

final class SarchBookInitial extends SarchBookState {}

final class SarchBookLoading extends SarchBookState {}

final class SarchBookSuccess extends SarchBookState {
  final List<Item> books;

  const SarchBookSuccess(this.books);
}

final class SarchBookFailure extends SarchBookState {
  final String errMessage;

  const SarchBookFailure(this.errMessage);
}
