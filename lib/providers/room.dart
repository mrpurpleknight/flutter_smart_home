import 'package:light_bulb/providers/device.dart';

class Room {
  final String _id;
  final String _name;
  final List<Device> _devices;
  final String svgPath;

  Room(this._id, this._name, this._devices, {this.svgPath});

  String get id => _id;
  List<Device> get devices => _devices;
  String get name => _name;
}
