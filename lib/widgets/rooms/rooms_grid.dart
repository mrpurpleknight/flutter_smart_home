import 'package:flutter/material.dart';
import 'package:light_bulb/providers/rooms.dart';
import 'package:provider/provider.dart';

import 'room_tile.dart';

class RoomsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rooms = Provider.of<Rooms>(context).rooms;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(rooms.length, (index) {
          return Provider.value(
            value: rooms.elementAt(index),
            child: RoomTile(),
          );
        }),
      ),
    );
  }
}
