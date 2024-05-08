class HadithListModel {
  final int id;
  final int chapterId;
  final int bookId;
  final String title;
  final int number;
  final String hadisRange;
  final String bookName;

  HadithListModel({
    required this.id,
    required this.chapterId,
    required this.bookId,
    required this.title,
    required this.number,
    required this.hadisRange,
    required this.bookName,
  });

  factory HadithListModel.fromJson(Map<String, dynamic> json) {
    return HadithListModel(
      id: json['id'],
      chapterId: json['chapter_id'],
      bookId: json['book_id'],
      title: json['title'],
      number: json['number'],
      hadisRange: json['hadis_range'],
      bookName: json['book_name'],
    );
  }
}

