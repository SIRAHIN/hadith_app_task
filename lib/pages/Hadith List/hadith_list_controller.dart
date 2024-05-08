
import 'package:get/get.dart';
import 'package:hadith_app/pages/Hadith%20List/hadith_list_model.dart';
import 'package:hadith_app/services/db_helper.dart';



class HadithListController extends GetxController {

  RxList<HadithListModel> hadithList = RxList([]);


  Future<List<HadithListModel>> fetchHadithList () async{
   hadithList.clear();
   var hadithListData = await DatabaseHelper.getData(tableName: "chapter");
   for (var element in hadithListData) {
    hadithList.add(HadithListModel.fromJson(element));
   }
   update();
   return hadithList;
  }
}