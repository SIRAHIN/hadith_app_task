class BookListModel {
  int id;
  String title;
  String titleAr;
  int numberOfHadis;
  String abvrCode;
  String bookName;
  String bookDescr;

  BookListModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.numberOfHadis,
    required this.abvrCode,
    required this.bookName,
    required this.bookDescr,
  });

  factory BookListModel.fromJson(Map<String, dynamic> json) {
    return BookListModel(
      id: json['id'],
      title: json['title'],
      titleAr: json['title_ar'],
      numberOfHadis: json['number_of_hadis'],
      abvrCode: json['abvr_code'],
      bookName: json['book_name'],
      bookDescr: json['book_descr'],
    );
  }

}