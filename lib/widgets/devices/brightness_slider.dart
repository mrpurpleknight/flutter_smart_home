import 'dart:async';

import 'package:flutter/material.dart';
import 'package:light_bulb/providers/device.dart';
import 'package:light_bulb/services/status.dart';
import 'package:provider/provider.dart';
import 'package:throttling/throttling.dart';

class BrightnessSlider extends StatefulWidget {
  @override
  _BrightnessSliderState createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  Device device;
  StreamSubscription _subscription;
  int _sliderValue = 0;
  bool _reflect = true;
  Debouncing _deb = Debouncing(duration: Duration(milliseconds: 200));

  @override
  void initState() {
    device = Provider.of<Device>(context, listen: false);
    Future.delayed(Duration.zero).then((value) {
      _subscription = device.stream.listen((Status status) {
        handleChange(status);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.pause();
    super.dispose();
  }

  void handleChange(Status status) {
    if (_reflect)
      setState(() {
        _sliderValue = status.brightness;
      });
  }

  void makeRequest(int value) {
    _deb.debounce(() {
      device.setBrightness(value);
    });
  }

  setReflect(bool state) {
    setState(() {
      _reflect = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.58,
      child: Column(
        children: [
          Text(
            'Brightness',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Slider(
            value: _sliderValue.toDouble(),
            min: 0,
            max: 100,
            onChangeStart: (_) {
              setReflect(false);
            },
            onChanged: (double value) {
              setState(() {
                _sliderValue = value.toInt();
              });
              makeRequest(value.toInt());
            },
            onChangeEnd: (_) {
              setReflect(true);
            },
            divisions: 2,
            inactiveColor: Colors.black12,
            activeColor: Colors.greenAccent,
            label: _sliderValue.toString(),
          ),
        ],
      ),
    );
  }
}
