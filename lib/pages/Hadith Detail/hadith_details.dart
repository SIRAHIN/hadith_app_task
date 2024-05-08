import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hadith_app/pages/Hadith%20Detail/chapter_model.dart';
import 'package:hadith_app/pages/Hadith%20Detail/hadith_details_controller.dart';
import 'package:hadith_app/pages/widgets/custom_hexaShape.dart';
import 'package:hadith_app/pages/widgets/custome_container.dart';
import 'package:hadith_app/utils/static_data.dart';
import 'package:hadith_app/utils/textStyle.dart';
import 'package:intl/intl.dart';
import 'widgets/chapter_tile.dart';
import 'widgets/hadits_app_bar.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  final subtitle = Get.arguments['title'];
  final title = Get.arguments['subtitle'];
  final chapterController = Get.put(HadithDetailsController());
  late final future = [
    chapterController.fetchChapterInfo(),
    chapterController.fetchHadithInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaditAppBar(subtitle: subtitle, title: title),
      body: Container(
        color: const Color(0xff0C0F16),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: Future.wait(future),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.hasData) {
                    return HadisListViewBuilder(
                      chapterController: chapterController,
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// chapter builder
class HadisListViewBuilder extends StatelessWidget {
  const HadisListViewBuilder({
    super.key,
    required this.chapterController,
  });

  final HadithDetailsController chapterController;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: chapterController.chapterList.length,
      itemBuilder: (context, index) {
        var hadisData = chapterController.chapterList[index];
        return HaditTileBuilder(
          chapterData: hadisData,
        );
      },
    );
  }
}

/// hadis builder
class HaditTileBuilder extends StatelessWidget {
  const HaditTileBuilder({
    super.key,
    required this.chapterData,
  });

  //section
  final ChapterModel chapterData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChapterTile(
          chapterNumber: chapterData.number.toString(),
          chapterTitle: chapterData.title ?? "got null",
          preface: chapterData.preface,
        ),
        // for divider from title text to preface text //

        HadisBuild(
          section: chapterData,
        )
      ],
    );
  }
}

class HadisBuild extends StatefulWidget {
  const HadisBuild({
    super.key,
    required this.section,
  });

  final ChapterModel section;

  @override
  State<HadisBuild> createState() => _HadisBuildState();
}

class _HadisBuildState extends State<HadisBuild> {
  late final items = widget.section.hadithList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++)
          Column(
            children: [
              CustomContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                  color:  const Color(0xff151C24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "${items[i].grade}",
                            style: ltitleTextStyle,
                          ),
                          subtitle: Text(
                            "হাদিস: ${NumberFormat.decimalPattern('bn').format(items[i].hadithId)}",
                            style: chapterIdTextStyle,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 7),
                                  child: Text(
                                    "${items[i].grade}",
                                    style: ltitleTextStyle,
                                  ),
                                ),
                              ),
                              GestureDetector(
                              onTap: () {
                                 showModalBottomSheet(context: context, builder: (context) {
                                  return Container(
                                  decoration: const BoxDecoration(
                                     color:  Color(0xff151C24),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children: [
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("অন্যান্য অপশন", style: bartitleTextStyle,),
                                            IconButton(onPressed: () {
                                              Navigator.pop(context);
                                            }, icon: Icon(Icons.close, color: Colors.white,))
                                          ],
                                        ),

                                        Expanded(
                                          child: ListView.builder(                                         
                                          itemCount: StaticData.bottomSheetData.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                          return  ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              leading: Image.asset("${StaticData.bottomSheetData[index]["icon"]}", height: 25,),
                                              title: Text("${StaticData.bottomSheetData[index]["title"]}", style: ltitleTextStyle,),
                                            );
                                          }, 
                                                                                  )
                                        )
                                      ],
                                    ),
                                  ),
                                  );
                                 },);
                              },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              )

  
                            ],
                          ),
                          leading: const SizedBox(
                            height: 45,
                            width: 45,
                            child: Custom_hexagon(avrbCode: "B"),
                          ),
                        ),
                        CustomContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "${items[i].ar}",
                              style: arabicText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Text(
                            "${items[i].narrator}",
                            style: narratorTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            "${items[i].bn}",
                            style: bodyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
