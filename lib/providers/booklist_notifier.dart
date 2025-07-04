import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:page_meet/models/book.dart';

final bookListProvider =
    StateNotifierProvider<BookListNotifier, List<Book>>((ref) {
  return BookListNotifier();
});

class BookListNotifier extends StateNotifier<List<Book>> {
  BookListNotifier() : super([]);

  Future<void> fetchBooks(String query) async {
    final url = Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$query&orderBy=newest&maxResults=10',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] as List<dynamic>? ?? [];

      state = items.map((item) => Book.fromJson(item)).toList();
    } else {
      // 오류 처리
      state = [];
    }
  }

  void updateBookProgress(String bookId, int currentPage) {
    state = [
      for (final book in state)
        if (book.id == bookId)
          book.copyWith(currentPage: currentPage)
        else
          book,
    ];
  }
}
