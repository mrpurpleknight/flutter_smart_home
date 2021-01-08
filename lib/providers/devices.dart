import 'package:flutter/material.dart';

import 'device.dart';

class Devices with ChangeNotifier {
  final List<Device> gardenDevices;
  final List<Device> bathroomDevices;
  final List<Device> kitchenDevices;
  final List<Device> livingDevices;
  final List<Device> diningDevices;
  final List<Device> officeDevices;

  Devices({
    @required this.gardenDevices,
    @required this.bathroomDevices,
    @required this.kitchenDevices,
    @required this.livingDevices,
    @required this.diningDevices,
    @required this.officeDevices,
  });

  List<Device> get all {
    return [
      ...gardenDevices,
      ...bathroomDevices,
      ...kitchenDevices,
      ...livingDevices,
      ...diningDevices,
      ...officeDevices,
    ];
  }

  List<Device> getDevicesFromRoomId(String roomId) {
    return all.where((element) => element.id == roomId).toList();
  }
}

