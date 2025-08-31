import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    final volumeInfo = book.volumeInfo;

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            // image
            CustomBookImage(imageUrl: volumeInfo.imageLinks?.thumbnail ?? ''),
            const Gap(30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    // book name
                    child: Text(
                      volumeInfo.title ?? 'بدون عنوان',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectreFine,
                      ),
                    ),
                  ),
                  const Gap(3),
                  // author
                  Text(
                    (volumeInfo.authors?.isNotEmpty ?? false)
                        ? volumeInfo.authors!.first
                        : 'مؤلف غير معروف',
                    style: Styles.textStyle14,
                  ),
                  const Gap(3),
                  Row(
                    children: [
                      // price (افتراضياً Free لو API مش راجع سعر)
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        reating: volumeInfo.averageRating ?? 0.0,
                        count: volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


