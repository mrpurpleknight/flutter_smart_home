import 'package:flutter/material.dart';

import 'providers/device_provider.dart';
import 'providers/room_provider.dart';

const String lampUrl = 'http://192.168.1.5:3000/lamp';

// ------------------ Theme ----------------
const bPrimaryColor = Color(0xFF0C9869);
const bSecondaryColor = Color(0xFFEEEEEE);
const bTextColor = Color(0xFF3C4046);

const bTileIconColor = Color(0xFF004D40);
const bTabIndicatorColor = Color(0xFFE0F2F1);
// -----------------------------------------

// ---------------- BottomBar --------------
const double bottomBarItemHeight = 55;
const double bottomBarIconSize = 26;

const IconData fabIcon = Icons.add;

const List<IconData> bottomBarItems = [
  Icons.menu,
  Icons.settings,
];

const List<Map<String, Object>> bottomDrawerItems = [
  {
    'label': 'Temp',
    'icon': 'assets/img/devices/thermostat.svg',
  },
  {
    'label': 'Energy',
    'icon': 'assets/img/devices/battery.svg',
  },
  {
    'label': 'Timer',
    'icon': 'assets/img/devices/timer.svg',
  }
];
// -----------------------------------------

// ---------------- Devices -----------------
final List<DeviceProvider> gardenDevices = [
  new DeviceProvider(
    'd1',
    'Light Bulb',
    'Philips Hue 2',
    'r1',
    svgPath: 'assets/img/devices/lightbulb.svg',
  ),
  new DeviceProvider('d9', 'Washing Machine', 'Whirlpool VF-54', 'r1',
      svgPath: 'assets/img/devices/washer.svg'),
  new DeviceProvider('d10', 'Smart TV', 'Samsung S24D391', 'r1',
      svgPath: 'assets/img/devices/tv.svg'),
];
final List<DeviceProvider> bathroomDevices = [
  new DeviceProvider('d2', 'Air Conditioner', 'Hitachi V2', 'r2',
      svgPath: 'assets/img/devices/conditioner.svg'),
  new DeviceProvider('d3', 'Washing Machine', 'Whirlpool VF-54', 'r2',
      svgPath: 'assets/img/devices/washer.svg')
];
final List<DeviceProvider> kitchenDevices = [
  new DeviceProvider('d4', 'Light Bulb', 'Philips Hue 2', 'r3',
      svgPath: 'assets/img/devices/lightbulb.svg'),
];
final List<DeviceProvider> livingDevices = [
  new DeviceProvider('d5', 'Light Bulb', 'Philips Hue 2', 'r4',
      svgPath: 'assets/img/devices/lightbulb.svg'),
  new DeviceProvider('d6', 'Smart TV', 'Samsung S24D391', 'r4',
      svgPath: 'assets/img/devices/tv.svg'),
  new DeviceProvider('d8', 'Air Conditioner', 'Hitachi V2', 'r6',
      svgPath: 'assets/img/devices/conditioner.svg'),
];
final List<DeviceProvider> diningDevices = [
  new DeviceProvider('d7', 'Refrigerator', 'Whirlpool WR190', 'r5',
      svgPath: 'assets/img/devices/refrigerator.svg')
];
final List<DeviceProvider> officeDevices = [
  new DeviceProvider('d11', 'Air Conditioner', 'Hitachi V2', 'r6',
      svgPath: 'assets/img/devices/conditioner.svg'),
];

final List<DeviceProvider> allDevices = [
  ...gardenDevices,
  ...bathroomDevices,
  ...kitchenDevices,
  ...livingDevices,
  ...diningDevices,
  ...officeDevices
];
// ------------------------------------------

// ---------------- RoomProviders ------------------
final List<RoomProvider> rooms = [
  new RoomProvider('r1', 'Garden', gardenDevices,
      svgPath: 'assets/img/rooms/garden.svg'),
  new RoomProvider('r2', 'Bathroom', bathroomDevices,
      svgPath: 'assets/img/rooms/bath.svg'),
  new RoomProvider('r3', 'Kitchen', kitchenDevices,
      svgPath: 'assets/img/rooms/kitchen.svg'),
  new RoomProvider('r4', 'Living Room', livingDevices,
      svgPath: 'assets/img/rooms/living.svg'),
  new RoomProvider('r5', 'Dining Room', diningDevices,
      svgPath: 'assets/img/rooms/dining.svg'),
  new RoomProvider('r6', 'Office', officeDevices,
      svgPath: 'assets/img/rooms/office.svg'),
];

// -----------------------------------------
