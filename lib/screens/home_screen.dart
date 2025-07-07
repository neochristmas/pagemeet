import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_meet/models/book.dart';
import 'package:page_meet/providers/booklist_notifier.dart';
import 'package:page_meet/theme/colors.dart';
import 'package:page_meet/widgets/category_section.dart';
import 'package:page_meet/widgets/spacing.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final booksProvider = StateNotifierProvider<BookListNotifier, List<Book>>(
    (ref) {
      final notifier = BookListNotifier();
      notifier.fetchBooks('hoover');
      return notifier;
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    return Scaffold(
      backgroundColor: AppColors.bodyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Home',
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
              CategorySection(
                title: 'Now Reading',
                books: books,
                isReading: true,
              ), // TODO: If Now Reading is empty
              10.h,
              CategorySection(
                title: 'Friends Are Reading',
                books: books,
                isReading: false,
              ), // TODO: Recommended by Readers
              10.h,
              CategorySection(
                title: 'New Releases',
                books: books,
                isReading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
