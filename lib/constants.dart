import 'package:flutter/material.dart';

import 'providers/device.dart';
import 'providers/room.dart';

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
final List<Device> gardenDevices = [
  new Device(
    'd1',
    'Light Bulb',
    'Philips Hue 2',
    svgPath: 'assets/img/devices/lightbulb.svg',
  ),
  new Device('d9', 'Washing Machine', 'Whirlpool VF-54',
      svgPath: 'assets/img/devices/washer.svg'),
  new Device('d10', 'Smart TV', 'Samsung S24D391',
      svgPath: 'assets/img/devices/tv.svg'),
];
final List<Device> bathroomDevices = [
  new Device('d2', 'Air Conditioner', 'Hitachi V2',
      svgPath: 'assets/img/devices/conditioner.svg'),
  new Device('d3', 'Washing Machine', 'Whirlpool VF-54',
      svgPath: 'assets/img/devices/washer.svg')
];
final List<Device> kitchenDevices = [
  new Device('d4', 'Light Bulb', 'Philips Hue 2',
      svgPath: 'assets/img/devices/lightbulb.svg'),
];
final List<Device> livingDevices = [
  new Device('d5', 'Light Bulb', 'Philips Hue 2',
      svgPath: 'assets/img/devices/lightbulb.svg'),
  new Device('d6', 'Smart TV', 'Samsung S24D391',
      svgPath: 'assets/img/devices/tv.svg'),
  new Device('d8', 'Air Conditioner', 'Hitachi V2',
      svgPath: 'assets/img/devices/conditioner.svg'),
];
final List<Device> diningDevices = [
  new Device('d7', 'Refrigerator', 'Whirlpool WR190',
      svgPath: 'assets/img/devices/refrigerator.svg')
];
final List<Device> officeDevices = [
  new Device('d11', 'Air Conditioner', 'Hitachi V2',
      svgPath: 'assets/img/devices/conditioner.svg'),
];

final List<Device> allDevices = [
  ...gardenDevices,
  ...bathroomDevices,
  ...kitchenDevices,
  ...livingDevices,
  ...diningDevices,
  ...officeDevices
];
// ------------------------------------------

// ---------------- RoomProviders ------------------
final List<Room> rooms = [
  new Room('r1', 'Garden', gardenDevices,
      svgPath: 'assets/img/rooms/garden.svg'),
  new Room('r2', 'Bathroom', bathroomDevices,
      svgPath: 'assets/img/rooms/bath.svg'),
  new Room('r3', 'Kitchen', kitchenDevices,
      svgPath: 'assets/img/rooms/kitchen.svg'),
  new Room('r4', 'Living Room', livingDevices,
      svgPath: 'assets/img/rooms/living.svg'),
  new Room('r5', 'Dining Room', diningDevices,
      svgPath: 'assets/img/rooms/dining.svg'),
  new Room('r6', 'Office', officeDevices,
      svgPath: 'assets/img/rooms/office.svg'),
];

// -----------------------------------------
