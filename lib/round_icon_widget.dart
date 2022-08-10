import 'package:flutter/material.dart';

class RoundIconWidget extends StatelessWidget {

  RoundIconWidget({required this.icon, this.onState, this.longPress});
  final String icon;
  final VoidCallback?onState;
  final VoidCallback?longPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        icon,
        style: TextStyle(
          fontSize: 40,
        ),
      ),
      onPressed: onState,
      onLongPress: longPress,
      elevation: 10,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
    );
  }
}