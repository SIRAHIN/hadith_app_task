import 'hadith_details_model.dart';

class ChapterModel {
  final int? id;
  final int? bookId;
  final String? bookName;
  final int? chapterId;
  final int? sectionId;
  final String? title;
  final String? preface;
  final String? number;
  final List<HadithDetailsModel> hadithList;

  ChapterModel({
    this.id,
    this.bookId,
    this.bookName,
    this.chapterId,
    this.sectionId,
    this.title,
    this.preface,
    this.number,
    this.hadithList = const [],
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    // return ChapterModel(
    //
    //
    // id : json['id'],
    // bookId : json['book_id'],
    // bookName : json['book_name'],
    // chapterId : json['chapter_id'],
    // sectionId : json['section_id'],
    // title : json['title'],
    // preface : json['preface',
    // number : json['number'],
    // );

    return ChapterModel(
      id: json['id'],
      bookId: json['book_id'],
      bookName: json['book_name'],
      chapterId: json['chapter_id'],
      sectionId: json['section_id'],
      title: json['title'],
      preface: json['preface'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['chapter_id'] = chapterId;
    data['section_id'] = sectionId;
    data['title'] = title;
    data['preface'] = preface;
    data['number'] = number;
    return data;
  }

  ChapterModel copyWith({
    int? id,
    int? bookId,
    String? bookName,
    int? chapterId,
    int? sectionId,
    String? title,
    String? preface,
    String? number,
    List<HadithDetailsModel>? hadithList,
  }) {
    return ChapterModel(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      bookName: bookName ?? this.bookName,
      chapterId: chapterId ?? this.chapterId,
      sectionId: sectionId ?? this.sectionId,
      title: title ?? this.title,
      preface: preface ?? this.preface,
      number: number ?? this.number,
      hadithList: hadithList ?? this.hadithList,
    );
  }
}
