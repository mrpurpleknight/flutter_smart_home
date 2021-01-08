import 'package:flutter/material.dart';
import 'package:light_bulb/providers/room.dart';


class Rooms{
  final List<Room> _rooms;

  Rooms(this._rooms);

  List<Room> get rooms {
    return _rooms;
  }

  String getRoomIconFromDeviceId(String id) {
    String path;
    for (var room in rooms) {
      for (var device in room.devices) {
        if (device.id == id) {
          path = room.svgPath;
        }
      }
    }
    return path;
  }

  Room getRoomFromId(String id) {
    return _rooms.firstWhere((element) => element.id == id);
  }

}
