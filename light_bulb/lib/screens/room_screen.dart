import 'package:flutter/material.dart';
import 'package:light_bulb/constants.dart';
import 'package:light_bulb/providers/device_list_provider.dart';
import 'package:light_bulb/providers/room_list_provider.dart';
import 'package:light_bulb/widgets/rooms/room_panel.dart';
import 'package:provider/provider.dart';

class RoomScreen extends StatelessWidget {
  static const String routeName = '/room-detail';

  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context).settings.arguments as String;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DeviceListProvider(
              gardenDevices: gardenDevices,
              bathroomDevices: bathroomDevices,
              kitchenDevices: kitchenDevices,
              livingDevices: livingDevices,
              diningDevices: diningDevices,
              officeDevices: officeDevices),
        ),
        Provider(
          create: (_) => RoomListProvider(rooms),
        ),
      ],
      child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              Provider.of<RoomListProvider>(context).getRoomFromId(roomId).name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            elevation: 0,
          ),
          body: RoomPanel(Provider.of<RoomListProvider>(context).getRoomFromId(roomId))),
    );
  }
}
