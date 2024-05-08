
import 'package:get/get.dart';
import 'package:hadith_app/services/db_helper.dart';

import 'bookListModel.dart';

class HomeController extends GetxController {

  RxList<BookListModel> bookList = RxList([]);


  Future<List<BookListModel>> fetchBookList () async{
   bookList.clear();
   var bookData = await DatabaseHelper.getData(tableName: "books");
  // log("$bookData");
   for (var element in bookData) {
    bookList.add(BookListModel.fromJson(element));
   }
   update();
   return bookList;
  }
}

