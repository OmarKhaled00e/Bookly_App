import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/result_list_view.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
    required this.searchController,
    required this.onSubmitted, required this.books,
  });
  final TextEditingController searchController;
    final List<Item> books;
  final Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            sarchController: searchController,
            onSubmitted: onSubmitted,
          ),
          Gap(20),
          Text('Search Result', style: Styles.textStyle18),
          Gap(20),
          Expanded(child: ResultListView(books: books)),
        ],
      ),
    );
  }
}
