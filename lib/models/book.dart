class Book {
  final String id;
  final String title;
  final List<String>? authors;
  final String? thumbnailUrl;
  final int currentPage;
  final int pageCount;
  final List<String>? categories;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnailUrl,
    required this.currentPage,
    required this.pageCount,
    required this.categories,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];

    return Book(
        id: json['id'],
        title: volumeInfo['title'] ?? 'No Title',
        authors: (json['volumeInfo']['authors'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        thumbnailUrl: volumeInfo['imageLinks'] != null
            ? volumeInfo['imageLinks']['thumbnail']
            : '',
        currentPage: 0,
        pageCount: volumeInfo['pageCount'] ?? 0,
        categories: (json['volumeInfo']['categories'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList());
  }
}

extension BookCopyWith on Book {
  Book copyWith({
    String? id,
    String? title,
    List<String>? authors,
    String? thumbnailUrl,
    int? currentPage,
    int? pageCount,
    List<String>? categories,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      currentPage: currentPage ?? this.currentPage,
      pageCount: pageCount ?? this.pageCount,
      categories: categories ?? this.categories,
    );
  }
}
