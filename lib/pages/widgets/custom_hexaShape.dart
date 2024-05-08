import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class Custom_hexagon extends StatelessWidget {
  final String avrbCode;

  
   const Custom_hexagon({
    super.key,
    required this.avrbCode 
  });



  @override
  Widget build(BuildContext context) {
    return HexagonWidget.flat(
      width: 150,
      color: const Color(0xff6FBC67),
      padding: 4.0,
      child: Text(
        avrbCode,
        style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}