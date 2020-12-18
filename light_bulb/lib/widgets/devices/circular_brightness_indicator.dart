import 'dart:async';

import 'package:flutter/material.dart';
import 'package:light_bulb/providers/device_provider.dart';
import 'package:light_bulb/providers/status.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularBrightnessIndicator extends StatefulWidget {
  @override
  _CircularBrightnessIndicatorState createState() => _CircularBrightnessIndicatorState();
}

class _CircularBrightnessIndicatorState extends State<CircularBrightnessIndicator> {
  StreamSubscription _subscription;
  int _brightness;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      _subscription = Provider.of<DeviceProvider>(context, listen: false)
          .stream
          .listen((Status status) {
        handleChange(status);
      });
    });

    _brightness = 0;
    super.initState();
  }

  @override
  void dispose() {
    _subscription.pause();
    super.dispose();
  }

  void handleChange(Status status) {
    _subscription.pause();
    if (_brightness != status.brightness)
      setState(() {
        _brightness = status.brightness;
      });
    _subscription.resume();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: _brightness),
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      builder: (_, int brightness, __) {
        return SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              showAxisLine: false,
              showLabels: false,
              minimum: 0,
              maximum: 100,
              ticksPosition: ElementsPosition.outside,
              radiusFactor: 0.9,
              majorTickStyle: MajorTickStyle(
                color: Colors.white,
                length: 0.1,
                thickness: 3,
                lengthUnit: GaugeSizeUnit.factor,
              ),
              minorTickStyle: MinorTickStyle(
                color: Colors.white,
                length: 0.05,
                thickness: 2.0,
                lengthUnit: GaugeSizeUnit.factor,
              ),
              minorTicksPerInterval: 3,
              interval: 10,
              labelOffset: 15,
              axisLabelStyle: GaugeTextStyle(fontSize: 12),
              pointers: <GaugePointer>[
                MarkerPointer(
                    value: brightness.toDouble(),
                    markerWidth: 22,
                    markerHeight: 22,
                    enableAnimation: true,
                    animationType: AnimationType.ease,
                    animationDuration: 2,
                    color: Colors.white,
                    markerType: MarkerType.circle,
                    markerOffset: 20),
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: brightness.toDouble(),
                    startWidth: 0.1,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF289AB1), Color(0xFF43E695)],
                        stops: <double>[0.25, 0.75]),
                    rangeOffset: -0.23,
                    endWidth: 0.1,
                    sizeUnit: GaugeSizeUnit.factor),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          brightness.toString(),
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          ' %',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    positionFactor: 0.13,
                    angle: 0)
              ],
            ),
          ],
        );
      },
    );
  }
}
