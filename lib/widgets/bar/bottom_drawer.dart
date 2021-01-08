import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_bulb/constants.dart';

class BottomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.23,
      padding: EdgeInsets.all(7),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView.builder(
        itemCount: bottomDrawerItems.length,
        itemBuilder: (context, index) {
          return Container(
              child: InkWell(
            onTap: () {},
            child: ListTile(
              tileColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.only(left: 13),
                child: SvgPicture.asset(
                    bottomDrawerItems.elementAt(index)['icon'],
                    color: Theme.of(context).cardColor, width: 32, height: 32,),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  bottomDrawerItems.elementAt(index)['label'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Theme.of(context).unselectedWidgetColor
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
