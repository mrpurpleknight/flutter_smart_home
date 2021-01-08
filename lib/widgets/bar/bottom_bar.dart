import 'package:flutter/material.dart';
import 'package:light_bulb/constants.dart';
import 'package:light_bulb/widgets/bar/bottom_bar_item.dart';

import 'bottom_drawer.dart';

class BottomBar extends StatefulWidget {
  final List<IconData> _items;

  BottomBar(this._items);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  void _showModalBottomDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return BottomDrawer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget._items.length, (int index) {
      return BottomBarItem(
        widget._items[index],
        height: bottomBarItemHeight,
        iconSize: bottomBarIconSize,
      );
    });

    Size size = MediaQuery.of(context).size;

    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _showModalBottomDrawer(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: items.elementAt(0),
            ),
          ),
          SizedBox(
            width: size.width * 0.75,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: items.elementAt(1),
          ),
        ],
      ),
      shape: CircularNotchedRectangle(),
    );
  }
}
