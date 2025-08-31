

import 'package:bookly/Features/search/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpls implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpls(this.apiService);

  @override
  Future<Either<Failure, List<Item>>> fatchSarchBooks({
    required String text,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$text',
      );
      List<Item> books = [];
      for (var item in data['items']) {
        books.add(Item.fromJson(item)); 
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioEroror(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
