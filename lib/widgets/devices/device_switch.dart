import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:light_bulb/providers/device.dart';
import 'package:light_bulb/providers/status.dart';
import 'package:provider/provider.dart';

class DeviceSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Device device = Provider.of<Device>(context);
    return StreamBuilder<Status>(
        stream: device.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting)
            return CircularProgressIndicator();
          return CupertinoSwitch(
            value: snapshot.data.on,
            activeColor: Theme.of(context).primaryColor,
            dragStartBehavior: DragStartBehavior.down,
            onChanged: (value) {
              device.setStatus(value);
            },
          );
        });
  }
}
