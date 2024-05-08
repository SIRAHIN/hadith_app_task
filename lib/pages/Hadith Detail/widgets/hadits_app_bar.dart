import 'package:flutter/material.dart';

import '../../widgets/custome_appBar.dart';

class HaditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HaditAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.maxFinite, 60),
      child: CustomAppBar(
        
        titleText: title,
        subTitleText: subtitle,
        actionWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Image.asset(
            "assets/images/icons/settings.png",
            color: Colors.white,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
