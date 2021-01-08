import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_bulb/providers/device.dart';
import 'package:light_bulb/providers/status.dart';

class DeviceTab extends StatefulWidget {
  final Device deviceProvider;

  DeviceTab(this.deviceProvider);

  @override
  _DeviceTabState createState() => _DeviceTabState();
}

class _DeviceTabState extends State<DeviceTab> {
  bool offline = false;

  @override
  void initState() {
    if (widget.deviceProvider.id != 'd1') {
      setState(() {
        offline = true;
      });
      return;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Status>(
        stream: widget.deviceProvider.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Transform.scale(
              scale: 0.7,
              child: CircularProgressIndicator(),
            );
          return (!offline)
              ? Tab(
                  icon: SvgPicture.asset(
                    widget.deviceProvider.svgPath,
                    width: (snapshot.data.on) ? 45 : 41,
                    height: (snapshot.data.on) ? 43 : 41,
                    color: (snapshot.data.on)
                        ? Colors.white
                        : Theme.of(context).unselectedWidgetColor,
                  ),
                  text: widget.deviceProvider.model,
                )
              : Tab(
                  icon: SvgPicture.asset(
                    widget.deviceProvider.svgPath,
                    width: 40,
                    height: 40,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                  text: widget.deviceProvider.model,
                );
        });
  }
}
