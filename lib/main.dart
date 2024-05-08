import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hadith_app/routes%20Controller/route_name.dart';
import 'package:hadith_app/routes%20Controller/route_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Hadith App',
      getPages: routes,
      initialRoute: RoutesName.homePage,
    );
  }
}