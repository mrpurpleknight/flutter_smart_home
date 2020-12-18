import 'package:flutter/material.dart';
import 'package:light_bulb/constants.dart';

class BottomBarItem extends StatefulWidget {
  final IconData icon;
  final double height;
  final double iconSize;

  BottomBarItem(this.icon, {this.height, this.iconSize});

  @override
  _BottomBarItemState createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomBarItemHeight,
      child: Material(
        type: MaterialType.transparency,
        child: Icon(widget.icon, color: Colors.white, size: bottomBarIconSize),
      ),
    );
  }
}
