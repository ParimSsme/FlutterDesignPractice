
import 'package:design/utils/constants.dart';
import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {

  final Widget child;
  final EdgeInsets padding;
  final double width, height;


  const BorderBox({Key? key, this.padding = const EdgeInsets.all(8), this.width = 20, this.height = 20, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40),width: 2)
      ),
      padding: padding,
      child: Center(child: child),
    );
  }
}
