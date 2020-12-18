import 'package:flutter/material.dart';
import 'package:light_bulb/widgets/bar/bottom_bar.dart';
import 'package:light_bulb/widgets/body/main_body.dart';

import '../constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Smart Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.notifications_none_outlined),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: FloatingActionButton(
          backgroundColor: Colors.teal[800],
          onPressed: () {},
          child: Icon(fabIcon),
          elevation: 2,
        ),
      ),
      bottomNavigationBar: BottomBar(bottomBarItems),
      body: MainBody(),
    );
  }
}
