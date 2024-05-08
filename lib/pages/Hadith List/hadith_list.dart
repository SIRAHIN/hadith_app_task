
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hadith_app/pages/Hadith%20List/hadith_list_controller.dart';

import 'package:hadith_app/pages/widgets/custom_hexaShape.dart';
import 'package:hadith_app/pages/widgets/custome_appBar.dart';
import 'package:hadith_app/pages/widgets/custome_container.dart';
import 'package:hadith_app/pages/widgets/custome_textField.dart';
import 'package:hadith_app/routes%20Controller/route_name.dart';
import 'package:hadith_app/utils/textStyle.dart';



class HadithList extends StatelessWidget {
  HadithList({super.key});

  final title = Get.arguments['title'];
  final subtitle = Get.arguments['subtitle'];
  final hadithListController = Get.put(HadithListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: const Size(double.infinity, 60), 
          child: CustomAppBar(
          titleText: title,
          subTitleText: subtitle.toString(),
          )
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff0C0F16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Custom_container(
                hSize: 70,
                widget: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomeTextField(),
                ),
              ),
              FutureBuilder(
                  future: hadithListController.fetchHadithList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.hasError) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var hadithListData = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Custom_container(
                                hSize: 80,
                                widget: ListTile(
                                  onTap: () =>
                                     Get.toNamed(RoutesName.hadithDetailsPage,
                                     arguments: {
                                      "title" : hadithListData.title,
                                      "subtitle" : title
                                     }
                                     ),
                                  leading: SizedBox(
                                    //height: 70,
                                    width: 50,
                                    child: Custom_hexagon(
                                    avrbCode: hadithListData.chapterId.toString(),
                                    ),
                                  ),
                                  title: Text(
                                    hadithListData.title,
                                    style: ltitleTextStyle,
                                  ),
                                  subtitle: Text(
                                      "হাদিসের রেঞ্জ ঃ ${hadithListData.hadisRange}" , style: lsubTitleTextStyle,),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}




