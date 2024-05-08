import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_app/pages/Home%20Page/home_controller.dart';
import 'package:hadith_app/pages/widgets/custome_container.dart';
import 'package:hadith_app/routes%20Controller/route_name.dart';
import 'package:hadith_app/utils/static_data.dart';
import 'package:hadith_app/utils/textStyle.dart';
import 'package:hexagon/hexagon.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff118C6F),
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title:  Text("আল হাদিস" , style: bartitleTextStyle,),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search_rounded,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          // image: DecorationImage(
          //     image: AssetImage(
          //       "assets/images/bg_img.jpg",
          //     ),
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text:  TextSpan(
                  text:
                      'কিয়ামতের দিন যে জিনিসটা মুমিনের পাল্লায় সবচেয়ে ভারি হবে তা হলো উওম চরিত্র। \n', style: bodyTextStyle,
                  children: const [
                    TextSpan(
                      text: '(আবু দাউদ – হাদিস নং ৪৮০১).\n\n\n',
                    ),
                    TextSpan(
                      text: '[উপদেশ]',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Custom_container(
                hSize: 100,
                widget: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: StaticData.listData.length,
                  itemBuilder: (context, index) {
                    var items = StaticData.listData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "${items["icon"]}",
                                height: 40,
                              ),
                              Text(
                                "${items["title"]}",
                                style: iconTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "সব হাদিসের বই",
                style: bartitleTextStyle,
              ),
              const SizedBox(height: 12,),
              FutureBuilder(
                future: homeController.fetchBookList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        return Custom_container(
                          hSize: 80,
                          widget: ListTile(
                            onTap: () => Get.toNamed(RoutesName.hadithListPage,
                                arguments: {
                                  "title": data.title,
                                  "subtitle": NumberFormat.decimalPattern('bn')
                                      .format(data.numberOfHadis)
                                }),
                            leading: SizedBox(
                              //height: 70,
                              width: 50,
                              child: HexagonWidget.flat(
                                width: 150,
                                color: const Color(0xff6FBC67),
                                padding: 4.0,
                                child: Text(
                                  data.abvrCode,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Text(
                              data.title,
                              style: ltitleTextStyle,
                            ),
                            subtitle:  Text("ইমাম বুখারি", style: lsubTitleTextStyle,),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  NumberFormat.decimalPattern('bn')
                                      .format(data.numberOfHadis),
                                  style: ltitleTextStyle,
                                ),
                                 Text(
                                  "হাদিস",
                                style: lsubTitleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
