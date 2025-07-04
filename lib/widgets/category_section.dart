import 'package:flutter/material.dart';
import 'package:page_meet/models/book.dart';
import 'package:page_meet/widgets/book_card.dart';
import 'package:page_meet/widgets/section_title.dart';
import 'package:page_meet/widgets/spacing.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.title,
    required this.books,
    required this.isReading,
  });

  final String title;
  final List<Book> books;
  final bool isReading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title),
          10.h,
          SizedBox(
            height: 210,
            child: ListView.separated(
              itemBuilder: (context, index) {
                final book = books[index];

                return Container(
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: BookCard(
                    book: book,
                    isReading: isReading,
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              separatorBuilder: (BuildContext context, int index) {
                return 13.w;
              },
            ),
          ),
        ],
      ),
    );
  }
}
