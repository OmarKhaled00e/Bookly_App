import 'package:bookly/Features/search/presentation/manager/cubit/sarch_book_cubit.dart';
import 'widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  void onSearch() {
    final query = searchController.text.trim();
    if (query.isNotEmpty) {
      BlocProvider.of<SarchBookCubit>(context).featchSarchBook(text: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SarchBookCubit, SarchBookState>(
          builder: (context, state) {
            if (state is SarchBookSuccess) {
              return SearchViewBody(
                searchController: searchController,
                onSubmitted: (_) => onSearch(),
                books: state.books,
              );
            } else if (state is SarchBookFailure) {
              return Center(child: Text(state.errMessage));
            } else if (state is SarchBookLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SearchViewBody(
              searchController: searchController,
              onSubmitted: (_) => onSearch(),
              books:[],
            );
          },
        ),
      ),
    );
  }
}
