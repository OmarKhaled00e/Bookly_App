import 'package:bookly/Features/search/data/repos/home_repo_impls.dart';
import 'package:bookly/Features/search/presentation/manager/cubit/sarch_book_cubit.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manger/similar_book_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SarchBookCubit(getIt.get<HomeRepoImpls>()),
            child: SearchView(),
          );
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(book: state.extra as Item,),
          );
        },
      ),
    ],
  );
}
