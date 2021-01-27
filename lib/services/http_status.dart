import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../providers/status.dart';

class HttpStatus {
  final http.Client client;

  HttpStatus() : client = new http.Client();

  Future<Status> get status async{
    var stateResponse = await client.get(lampUrl);
    return Status.fromJson(jsonDecode(stateResponse.body));
  }

   setStatus(bool value) async {
    String toSet = (value) ? 'on' : 'off';
    await client.post(
      lampUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'state': toSet,
      }),
    );
  }

  setBrightness(int value) async{
    await client.post(
      lampUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'brightness': value.toString(),
      }),
    );
  }
}