import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:light_bulb/constants.dart';
import 'package:light_bulb/providers/room_provider.dart';
import 'package:light_bulb/widgets/devices/function/function_tile.dart';
import 'package:light_bulb/widgets/devices/tab/devices_tab_bar.dart';
import 'package:light_bulb/widgets/devices/tab/empty_tab_view.dart';
import 'package:light_bulb/widgets/devices/tab/light_tab_view.dart';
import 'package:provider/provider.dart';

class RoomPanel extends StatefulWidget {
  final RoomProvider room;

  RoomPanel(this.room);

  @override
  _RoomPanelState createState() => _RoomPanelState();
}

class _RoomPanelState extends State<RoomPanel> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: widget.room.devices.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).primaryColor,
      width: size.width,
      child: ChangeNotifierProvider.value(
        value: widget.room.devices.elementAt(_tabController.index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.05),
              child: DevicesTabBar(_tabController, widget.room.devices),
            ),
            Container(
              height: size.height * 0.55,
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (int i = 0; i < widget.room.devices.length; i++)
                    (widget.room.devices.elementAt(i).id == 'd1')
                        ? LightTabBarView()
                        : EmptyTabBarView(),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                padding: EdgeInsets.all(15),
                height: size.height * 0.17,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0), //(x,y)
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...bottomDrawerItems.map((e) {
                      return FunctionTile(e['icon'], e['label']);
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
