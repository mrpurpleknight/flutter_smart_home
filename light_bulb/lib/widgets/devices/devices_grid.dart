import 'package:flutter/material.dart';
import 'package:light_bulb/providers/device_list_provider.dart';
import 'package:light_bulb/providers/room_list_provider.dart';
import 'package:provider/provider.dart';

import 'device_tile.dart';

class DevicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devicesProvider = Provider.of<DeviceListProvider>(context);
    final roomsProvider = Provider.of<RoomListProvider>(context);
    final devices = devicesProvider.all;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(devices.length, (index) {
          return ChangeNotifierProvider.value(
            value: devices.elementAt(index),
            child: DeviceTile(
              roomSvgPath: roomsProvider
                  .getRoomIconFromDeviceId(devices.elementAt(index).id),
            ),
          );
        }),
      ),
    );
  }
}
