import 'package:flutter/material.dart';
import 'package:hadith_app/utils/textStyle.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: "অধ্যায় সার্চ করুন",
      hintStyle: bodyTextStyle,
      disabledBorder: InputBorder.none,
      suffixIcon: const Icon(Icons.search_sharp, color: Colors.white,)
    ),
    
    );
  }
}