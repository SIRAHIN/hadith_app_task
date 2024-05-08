import 'package:flutter/material.dart';

class Custom_container extends StatelessWidget {
  double? hSize;
  Widget? widget;
  bool? isCenter;
  EdgeInsetsGeometry? mrg;
  Custom_container(
      {super.key, this.hSize, this.widget, this.isCenter, this.mrg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: mrg,
      alignment: isCenter == false ? Alignment.centerLeft : Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff151C24),
      ),
      height: hSize,
      width: double.infinity,
      child: widget,
    );
  }
}

///  Custome container
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.alignment = Alignment.centerLeft,
  });
  final Widget child;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: child,
    );
  }
}
