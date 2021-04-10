import 'package:flutter/material.dart';
import 'constant.dart';

class CircleButton extends StatelessWidget {
  CircleButton({this.onPressed, this.childIcon});
  final Widget childIcon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      elevation: 2.0,
      onPressed: onPressed,
      child: childIcon,
      fillColor: kPinkColor,
      shape: CircleBorder(),
    );
  }
}
