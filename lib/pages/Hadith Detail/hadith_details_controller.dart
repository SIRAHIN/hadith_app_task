import 'dart:developer';
import 'package:collection/collection.dart';

import 'package:get/get.dart';
import 'package:hadith_app/pages/Hadith%20Detail/chapter_model.dart';
import 'package:hadith_app/pages/Hadith%20Detail/hadith_details_model.dart';
import 'package:hadith_app/services/db_helper.dart';

class HadithDetailsController extends GetxController {
  RxList<ChapterModel> chapterList = RxList([]);

  Future<List<ChapterModel>> fetchChapterInfo() async {
    chapterList.clear();
    var dataList = await DatabaseHelper.getData(tableName: "section");
    for (var element in dataList) {
      chapterList.add(ChapterModel.fromJson(element));
    }
    update();
    return chapterList;
  }

  Future<List<HadithDetailsModel>> fetchHadithInfo() async {
    final List<HadithDetailsModel> haidithData = [];
    var dataList = await DatabaseHelper.getData(tableName: "hadith");
    log("this is from fetch : $dataList");
    for (var element in dataList) {
      haidithData.add(HadithDetailsModel.fromJson(element));
    }

    final groupItems = groupBy(haidithData, (p0) => p0.sectionId);

    for (int i = 0; i < chapterList.length; i++) {
      final key = chapterList[i].sectionId;
      if (key == null) continue;
      chapterList[i] = chapterList[i].copyWith(hadithList: groupItems[key]);
    }
    update();

    return haidithData;
  }
}
