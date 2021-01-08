import 'package:flutter/material.dart';

import 'device_provider.dart';

class DeviceListProvider with ChangeNotifier {
  final List<DeviceProvider> gardenDevices;
  final List<DeviceProvider> bathroomDevices;
  final List<DeviceProvider> kitchenDevices;
  final List<DeviceProvider> livingDevices;
  final List<DeviceProvider> diningDevices;
  final List<DeviceProvider> officeDevices;

  DeviceListProvider({
    @required this.gardenDevices,
    @required this.bathroomDevices,
    @required this.kitchenDevices,
    @required this.livingDevices,
    @required this.diningDevices,
    @required this.officeDevices,
  });

  List<DeviceProvider> get all {
    return [
      ...gardenDevices,
      ...bathroomDevices,
      ...kitchenDevices,
      ...livingDevices,
      ...diningDevices,
      ...officeDevices,
    ];
  }

  List<DeviceProvider> getDevicesFromRoomId(String roomId) {
    return all.where((element) => element.id == roomId).toList();
  }
}

