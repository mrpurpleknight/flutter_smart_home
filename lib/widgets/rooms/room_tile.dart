import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_bulb/providers/room.dart';
import 'package:light_bulb/screens/room_screen.dart';
import 'package:provider/provider.dart';

class RoomTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final room = Provider.of<Room>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: () => {Navigator.of(context).pushNamed(RoomScreen.routeName, arguments: room.id)},
          highlightColor: Theme.of(context).primaryColor.withOpacity(0.3),
          splashColor: Colors.teal.withOpacity(0.3),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Theme.of(context).cardColor, width: 1.8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.12),
                  child: SizedBox.fromSize(
                    size: Size(constraints.maxWidth * 0.32,
                        constraints.maxHeight * 0.32),
                    child: SvgPicture.asset(
                      room.svgPath,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
                Text(
                  room.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Text(
                  '${room.devices.length} devices',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
