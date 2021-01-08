import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:light_bulb/widgets/body/circle_tab_indicator.dart';
import 'package:light_bulb/widgets/devices/devices_grid.dart';
import 'package:light_bulb/widgets/rooms/rooms_grid.dart';

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Theme.of(context).indicatorColor,
            indicator: CircleTabIndicator(
                color: Theme.of(context).indicatorColor, radius: 2),
            labelColor: Theme.of(context).indicatorColor,
            unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
            tabs: [
              Tab(
                text: 'Rooms',
              ),
              Tab(text: 'Devices'),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.77,
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        RoomsGrid(),
                        DevicesGrid(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
