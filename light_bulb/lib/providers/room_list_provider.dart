import 'package:flutter/material.dart';
import 'package:light_bulb/providers/room_provider.dart';


class RoomListProvider{
  final List<RoomProvider> _rooms;

  RoomListProvider(this._rooms);

  List<RoomProvider> get rooms {
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

  RoomProvider getRoomFromId(String id) {
    return _rooms.firstWhere((element) => element.id == id);
  }

}
