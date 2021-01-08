import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:light_bulb/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_bulb/providers/device.dart';
import 'package:light_bulb/providers/status.dart';
import 'package:light_bulb/widgets/devices/device_switch.dart';
import 'package:provider/provider.dart';
import 'package:throttling/throttling.dart';

class DeviceTile extends StatefulWidget {
  final roomSvgPath;

  DeviceTile({this.roomSvgPath});

  @override
  _DeviceTileState createState() => _DeviceTileState();
}

class _DeviceTileState extends State<DeviceTile> {
  bool offline = false;
  bool loading = false;
  bool _status;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      var device = Provider.of<Device>(context, listen: false);
      if (device.id != 'd1') {
        setState(() {
          offline = true;
        });
      }

      _subscription = device.stream.listen((Status status) {
        setState(() {
          handleChange(status);
        });
      });
    });
  }

  @override
  void dispose() {
    _subscription.pause();
    super.dispose();
  }

  void handleChange(Status status) {
    setState(() {
      _status = status.on;
      Future.delayed(Duration(seconds: 3)).then((value) => loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final device = Provider.of<Device>(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 11,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Theme.of(context).cardColor, width: 1.8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            //left padding for all
            padding: EdgeInsets.only(left: constraints.maxWidth * 0.11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      //vertical padding for Icon
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.06),
                      child: SvgPicture.asset(
                        device.svgPath,
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.3,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    if (loading)
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Transform.scale(
                          scale: 0.8,
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                ),
                Text(
                  device.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  device.model,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.75,
                          child: (offline)
                              ? CupertinoSwitch(
                                  value: false,
                                  activeColor: bPrimaryColor,
                                  dragStartBehavior: DragStartBehavior.down,
                                  onChanged: (value) {},
                                )
                              : (_status == null)
                                  ? CircularProgressIndicator()
                                  : CupertinoSwitch(
                                      value: _status,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      dragStartBehavior: DragStartBehavior.down,
                                      onChanged: (value) {
                                        Throttling thr = Throttling(
                                            duration:
                                                Duration(milliseconds: 1000));
                                        thr.throttle(() {
                                          device.setStatus(value);
                                          setState(() {
                                            loading = true;
                                          });
                                        });
                                      },
                                    ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: constraints.maxWidth * 0.2),
                      child: SvgPicture.asset(
                        widget.roomSvgPath,
                        width: constraints.maxWidth * 0.15,
                        height: constraints.maxHeight * 0.15,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    });
  }
}
