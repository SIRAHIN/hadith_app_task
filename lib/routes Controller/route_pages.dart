import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hadith_app/pages/Hadith%20Detail/hadith_details.dart';
import 'package:hadith_app/pages/Hadith%20List/hadith_list.dart';
import 'package:hadith_app/pages/Home%20Page/home_page.dart';
import 'package:hadith_app/routes%20Controller/route_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: RoutesName.homePage, page: () =>   HomePage()),
  GetPage(name: RoutesName.hadithListPage, page: () =>   HadithList()),
  GetPage(name: RoutesName.hadithDetailsPage, page: () =>    const HadithDetails())
]; 