import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_meet/models/book.dart';
import 'package:page_meet/providers/booklist_notifier.dart';
import 'package:page_meet/providers/reading_book_provider.dart';
import 'package:page_meet/theme/colors.dart';
import 'package:page_meet/widgets/spacing.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BookCard extends ConsumerWidget {
  const BookCard({
    super.key,
    required this.book,
    required this.isReading,
  });

  final Book book;
  final bool isReading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatedBook = ref
        .watch(bookListProvider)
        .firstWhere((b) => b.id == book.id, orElse: () => book);
    final percent = 130 / updatedBook.pageCount;

    return InkWell(
      onTap: () {
        if (isReading) {
          showReadingBookDetailDialog(context, book, ref);
        }
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 4 / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: book.thumbnailUrl != null
                    ? Image.network(
                        book.thumbnailUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.lightGray,
                          child: const Icon(Icons.broken_image),
                        ),
                      )
                    : Container(
                        color: AppColors.lightGray,
                        child: const Icon(Icons.book),
                      ),
              ),
            ),
            2.h,
            Visibility(
              visible: isReading,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                ),
                child: LinearPercentIndicator(
                  width: 115,
                  animation: true,
                  lineHeight: 7,
                  animationDuration: 2000,
                  percent: 0.9,
                  barRadius: Radius.circular(45),
                  progressColor: AppColors.progress,
                  padding: EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                ),
              ),
            ),
            Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            1.h,
            Visibility(
              visible: !isReading,
              child: Text(
                book.authors?.join(', ') ?? 'Unknown Author',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showReadingBookDetailDialog(
      BuildContext context, Book book, WidgetRef ref) {
    final currentPageController = TextEditingController(
      text: ref.read(currentPageProvider).toString(),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.bottomBackground,
        contentPadding: EdgeInsets.all(
          16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Consumer(builder: (context, ref, _) {
          final currentPage = ref.watch(currentPageProvider);
          final totalPages = 390;
          final progress = currentPage / totalPages;

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  // Cover
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      book.thumbnailUrl!,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: AppColors.lightGray,
                        child: const Icon(
                          Icons.broken_image,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                  12.h, // Title, Authors
                  Text(
                    book.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    book.authors?.join(', ') ?? 'Unknown Author',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGray,
                    ),
                  ),
                  8.h, // Start Date
                  Text(
                    'Start Date: 05/07/2025',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGray,
                    ),
                  ),
                  8.h, // Pages
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(45),
                      color: AppColors.progress,
                      backgroundColor: AppColors.lightGray,
                    ),
                  ),
                  3.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: TextField(
                          controller: currentPageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            isDense: true,
                          ),
                          onChanged: (value) {
                            final parsed = int.tryParse(value);
                            if (parsed != null) {
                              ref.read(currentPageProvider.notifier).state =
                                  parsed;
                            }
                          },
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      8.w,
                      Text(
                        '/ $totalPages pages',
                        style:
                            TextStyle(fontSize: 10, color: AppColors.darkGray),
                      ),
                    ],
                  ),
                  16.h,
                  // Star
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 3 ? Icons.star : Icons.star_border,
                        color: AppColors.primary,
                        size: 30,
                      );
                    }),
                  ),
                  20.h,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.updateButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            // 수정된 페이지 저장 처리
                            final updatedPage =
                                int.tryParse(currentPageController.text) ?? 0;
                            ref
                                .read(bookListProvider.notifier)
                                .updateBookProgress(book.id, updatedPage);
                            Navigator.of(context).pop();
                            // print('Updated to $updatedPage pages');
                          },
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      12.w,
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            // markBookAsFinished(book);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Mark as Read',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
