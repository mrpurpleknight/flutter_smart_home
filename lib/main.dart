import 'dart:io';

import 'package:flutter/material.dart';
import 'package:light_bulb/providers/devices.dart';
import 'package:light_bulb/providers/rooms.dart';
import 'package:light_bulb/screens/main_screen.dart';
import 'package:light_bulb/screens/room_screen.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Devices(
            gardenDevices: gardenDevices,
            bathroomDevices: bathroomDevices,
            diningDevices: diningDevices,
            livingDevices: livingDevices,
            kitchenDevices: kitchenDevices,
            officeDevices: officeDevices,
          ),
        ),
        Provider(
          create: (_) => Rooms(rooms),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Smart Home",
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: bPrimaryColor,
            backgroundColor: bSecondaryColor,
            cardColor: bTileIconColor,
            indicatorColor: bTabIndicatorColor,
            unselectedWidgetColor: bTextColor,
            textTheme: ThemeData.light()
                .textTheme
                .copyWith(title: TextStyle(color: bTextColor))),
        home: MainScreen(),
        routes: {
          RoomScreen.routeName: (ctx) => RoomScreen(),
        },
      ),
    );
  }
}
