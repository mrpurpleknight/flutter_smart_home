import 'dart:async';
import 'package:flutter/material.dart';
import 'package:light_bulb/services/http_status.dart';

import 'status.dart';

class Device with ChangeNotifier {
  final String id;
  final String _name;
  final String _model;
  final String _roomId;
  final String svgPath;
  final _controller = StreamController<Status>.broadcast();
  final HttpStatus _http;

  Device(
    this.id,
    this._name,
    this._model,
    this._roomId, {
    @required this.svgPath,
  }) : _http = new HttpStatus();

  String get model => _model;

  String get name => _name;

  get stream {
    listenStatus();
    return _controller.stream;
  }


  listenStatus() async{
    while (true) {
      try {
        await Future.delayed(Duration(milliseconds: 1200));
        Status stateResponse = await _http.status;
        _controller.sink.add(stateResponse);
      } catch (e) {
        return;
      }
    }
  }

  Future<void> setStatus(bool state) async{
    await _http.setStatus(state);
  }

  Future<void> setBrightness(int brightness) async {
     await _http.setBrightness(brightness);
  }

}
