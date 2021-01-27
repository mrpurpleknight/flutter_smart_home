import 'dart:async';
import 'package:flutter/material.dart';
import 'package:light_bulb/services/http_status.dart';

import '../services/status.dart';

class Device with ChangeNotifier {
  final String id;
  final String _name;
  final String _model;
  final String svgPath;
  final _controller;
  final HttpStatus _http;

  Device(
    this.id,
    this._name,
    this._model, {
    @required this.svgPath,
  })  : _http = new HttpStatus(),
        _controller = StreamController<Status>.broadcast();

  String get model => _model;
  String get name => _name;
  get stream {
    listenStatus();
    return _controller.stream;
  }

  listenStatus() async {
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

  Future<void> setStatus(bool state) async {
    await _http.setStatus(state);
  }

  Future<void> setBrightness(int brightness) async {
    await _http.setBrightness(brightness);
  }
}
