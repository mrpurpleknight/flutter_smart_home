import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_bulb/providers/device_provider.dart';
import 'package:light_bulb/widgets/devices/tab/device_tab.dart';

class DevicesTabBar extends StatefulWidget {
  final TabController _tabController;
  final List<DeviceProvider> devices;

  DevicesTabBar(this._tabController, this.devices);

  @override
  _DevicesTabBarState createState() => _DevicesTabBarState();
}

class _DevicesTabBarState extends State<DevicesTabBar> {

  List<bool> statusList;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devicesMap = widget.devices.asMap();

    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 32),
      controller: widget._tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      unselectedLabelStyle:
         const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      labelColor: Theme.of(context).indicatorColor,
      unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
      tabs: [
        ...devicesMap
            .map(
              (i, e) => MapEntry(
                i,
                DeviceTab(e),
              ),
            )
            .values
            .toList(),
      ],
    );
  }
}
