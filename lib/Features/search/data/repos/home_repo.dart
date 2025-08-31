import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Item>>> fatchSarchBooks({
    required String text,
  });
}
