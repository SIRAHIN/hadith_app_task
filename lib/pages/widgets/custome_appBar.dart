import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_app/routes%20Controller/route_name.dart';
import 'package:hadith_app/utils/textStyle.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? actionWidget;
  final String? titleText;
  final String? subTitleText;
  
  const CustomAppBar({
    super.key,
    this.actionWidget,
    this.titleText,
    this.subTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff151C24),
      leading: IconButton(
          onPressed: () => Get.toNamed(RoutesName.homePage),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText!,
            style: bartitleTextStyle,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            subTitleText!,
            style: lsubTitleTextStyle,
          )
        ],
      ),
      actions: [actionWidget ?? Container()],
    );
  }
}
