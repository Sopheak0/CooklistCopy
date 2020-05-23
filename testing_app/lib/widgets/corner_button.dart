import 'package:flutter/material.dart';

class CornerButton extends StatelessWidget {
  Function onpressed;
  String txt;
  Icon leftIcon;
  Color color;
  Color txtColor;
  Color roundColor;
  CornerButton(
      {this.txt,
      this.onpressed,
      this.leftIcon,
      this.color,
      this.txtColor,
      this.roundColor});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: roundColor != null ? roundColor : BorderSide.none,
      ),
      onPressed: onpressed,
      color: color != null ? color : Colors.red,
      textColor: txtColor != null ? txtColor : Colors.white,
      child: Row(
        children: <Widget>[
          (leftIcon != null) ? leftIcon : SizedBox(),
          Text(txt, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
