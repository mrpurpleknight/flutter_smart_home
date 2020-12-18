import 'package:flutter/material.dart';
import 'package:light_bulb/widgets/devices/brightness_slider.dart';

import '../circular_brightness_indicator.dart';

class LightTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: size.height * 0.3,
          child: Container(
            child: CircularBrightnessIndicator(),
          ),
        ),
        BrightnessSlider(),

      ],
    );
  }
}
