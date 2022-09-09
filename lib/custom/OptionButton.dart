import 'package:design/utils/constants.dart';
import 'package:design/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  
  final String text;
  final IconData icon;
  final double width;
  
  const OptionButton({Key? key, this.text="", this.icon=Icons.map_rounded, this.width=5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: 45,
        child: FlatButton(
            color: COLOR_DARK_BLUE,
            splashColor: COLOR_WHITE.withAlpha(55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: COLOR_WHITE,),
                addHorizontalSpace(10),
                Text(text,style: TextStyle(color: COLOR_WHITE, fontSize: 16), ),
              ],
            )),
      ),
    );
  }
}
