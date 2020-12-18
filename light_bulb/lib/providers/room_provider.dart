import 'package:light_bulb/providers/device_provider.dart';

class RoomProvider {
  final String _id;
  final String _name;
  final List<DeviceProvider> _devices;
  final String svgPath;

  RoomProvider(this._id, this._name, this._devices, {this.svgPath});


  String get id => _id;
  List<DeviceProvider> get devices => _devices;
  String get name => _name;
}
