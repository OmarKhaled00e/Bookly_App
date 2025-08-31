import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:flutter/material.dart';


class ResultListView extends StatelessWidget {
  const ResultListView({super.key, required this.books});
  
  final List<Item> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length, 
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final book = books[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(book: book), 
        );
      },
    );
  }
}



