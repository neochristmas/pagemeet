import 'package:flutter/material.dart';
import 'package:page_meet/models/book.dart';
import 'package:page_meet/theme/colors.dart';
import 'package:page_meet/widgets/section_title.dart';
import 'package:page_meet/widgets/spacing.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Book> books = [
      Book(
        id: '123',
        title: 'Verity',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 189,
        categories: ['Biography'],
      ),
      Book(
        id: '123',
        title: 'It starts with Us',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 150,
        categories: ['Crime', 'Science'],
      ),
      Book(
        id: '123',
        title: 'It starts with Us',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 200,
        categories: ['Health'],
      ),
      Book(
        id: '123',
        title: 'It starts with Us',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 580,
        categories: ['Romance'],
      ),
      Book(
        id: '123',
        title: 'Hey What is your name',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 203,
        categories: ['Business'],
      ),
      Book(
        id: '123',
        title: 'How are you',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 389,
        categories: ['Crime', 'Science'],
      ),
      Book(
        id: '123',
        title: 'So',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 389,
        categories: ['Crime', 'Fictions'],
      ),
      Book(
        id: '123',
        title: 'It starts with Us',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 389,
        categories: ['Arts'],
      ),
      Book(
        id: '123',
        title: 'NCT DREAM',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 389,
        categories: ['Crime'],
      ),
      Book(
        id: '123',
        title: 'It starts with Us',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 800,
        categories: ['Biography'],
      ),
      Book(
        id: '123',
        title: 'It starts with Us',
        authors: ['authors'],
        thumbnailUrl:
            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        currentPage: 100,
        pageCount: 389,
        categories: ['Children'],
      )
    ];
    return Scaffold(
      backgroundColor: AppColors.bodyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'My Library',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.bottomBackground,
          ),
        ),
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.bookshelfBackgroud,
                  border: Border.all(
                    color: AppColors.bookshelfBorder,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: buildShelfRows(books),
                ),
              ),
              20.h,
              SectionTitle(title: 'Currently Reading'),
              10.h,
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 110,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'http://books.google.com/books/content?id=2zRxEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                            height: 110,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 110,
                              color: AppColors.lightGray,
                              child: const Icon(
                                Icons.broken_image,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                        10.w,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book Title Here',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text,
                                ),
                              ),
                              Text(
                                'Status: Temporary Stopping',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.darkGray,
                                ),
                              ),
                              Text(
                                'Start Date: 07/07/2025',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.darkGray,
                                ),
                              ),
                              Text(
                                'Progress: 130 / 398',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.darkGray,
                                ),
                              ),
                              Text(
                                'Genre: Fiction',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.darkGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return 7.h;
                },
                itemCount: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBookSpine(Book book) {
  return Container(
    width: getBookWidth(book.pageCount), // 책등 폭
    height: getBookHeight(book.title), // 책등 높이
    decoration: BoxDecoration(
      color: getSpineColor(
        book.categories.toString(),
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    alignment: Alignment.center,
    child: RotatedBox(
      quarterTurns: 3, // 텍스트를 세로로 회전
      child: Text(
        book.title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    ),
  );
}

Color getSpineColor(String? categoryStr) {
  if (categoryStr == null || categoryStr.isEmpty) {
    return Colors.grey; // 기본 색상
  }

  final category = categoryStr.toLowerCase();

  if (category.contains('fiction')) {
    return Colors.redAccent;
  } else if (category.contains('science')) {
    return Colors.green;
  } else if (category.contains('biography')) {
    return Colors.blueGrey;
  } else if (category.contains('history')) {
    return Colors.brown;
  } else if (category.contains('fantasy')) {
    return Colors.purpleAccent;
  } else if (category.contains('romance')) {
    return Colors.pinkAccent;
  } else if (category.contains('mystery') || category.contains('thriller')) {
    return Colors.deepPurple;
  } else if (category.contains('self-help')) {
    return Colors.orangeAccent;
  } else if (category.contains('health')) {
    return Colors.teal;
  } else if (category.contains('business')) {
    return Colors.indigo;
  } else if (category.contains('religion') ||
      category.contains('spirituality')) {
    return Colors.amber;
  } else if (category.contains('arts')) {
    return Colors.cyan;
  } else if (category.contains('technology') ||
      category.contains('computers')) {
    return Colors.lightBlueAccent;
  } else if (category.contains('cookbook') || category.contains('food')) {
    return Colors.deepOrange;
  } else if (category.contains('travel')) {
    return Colors.lightGreen;
  } else if (category.contains('children')) {
    return Colors.yellowAccent.shade700;
  } else if (category.contains('comics') ||
      category.contains('graphic novel')) {
    return Colors.pink;
  } else if (category.contains('poetry')) {
    return Colors.indigoAccent;
  } else if (category.contains('education') || category.contains('teaching')) {
    return Colors.blueAccent;
  } else {
    return Colors.grey; // 기타 기본 색상
  }
}

List<Widget> buildShelfRows(List<Book> books) {
  final booksPerRow = 10;
  final rows = <Widget>[];

  for (var i = 0; i < books.length; i += booksPerRow) {
    final rowBooks = books.skip(i).take(booksPerRow).toList();
    rows.add(
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: rowBooks.asMap().entries.map((entry) {
              final index = entry.key;
              final book = entry.value;

              final isLast =
                  index == rowBooks.length - 1 && rowBooks.length > 1;
              final spine = buildBookSpine(book);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.3),
                child: isLast
                    ? Transform.translate(
                        offset: Offset(8.3, 0),
                        child: Transform.rotate(
                          angle: -0.1,
                          alignment: Alignment.bottomCenter,
                          child: spine,
                        ),
                      )
                    : spine,
              );
            }).toList(),
          ),
          const Divider(
            color: Colors.brown,
            thickness: 8,
            height: 8,
          ),
          12.h,
        ],
      ),
    );
  }
  return rows;
}

double getBookWidth(int pageCount) {
  return (pageCount.clamp(100, 500) - 100) / 400 * 20 + 15;
}

double getBookHeight(String title) {
  final len = title.length.clamp(5, 30);
  return 80 + (30 - len) * 1.2; // 짧은 제목일수록 더 높음
}
