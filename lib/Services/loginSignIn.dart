import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class Services {
  static var deviceName = "", deviceVersion = "", deviceId = "";

  Future<void> _getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      var build = await deviceInfoPlugin.androidInfo;
      if (Platform.isAndroid) {
        deviceName = build.model;
        deviceVersion = build.version.toString();
        deviceId = build.id;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.model.toString();
        deviceVersion = data.systemVersion.toString();
        deviceId = data.identifierForVendor.toString();
      }
    } catch (e) {
      print("unable to get device information");
    }
  }

  Services() {}

  Future<String> getDeviceId() async {
    await _getDeviceDetails();
    return deviceId;
  }
}
