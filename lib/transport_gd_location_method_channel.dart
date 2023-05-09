import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:transport_gd_location/model/shipping_note.dart';

import 'transport_gd_location_platform_interface.dart';
import 'model/result_model.dart';
import 'model/service_config.dart';

/// An implementation of [GdLocationPlatform] that uses method channels.
class MethodChannelTransportGdLocation extends TransportGdLocationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gd_location');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
    await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> initSdk({String? gdAppKey}) {
    return methodChannel.invokeMethod(
      'initSdk',
      {'gdAppKey': gdAppKey},
    );
  }

  @override
  Future<ResultModel?> openService({
    required ServiceConfig? serviceConfig,
  }) {
    return methodChannel
        .invokeMethod(
      'openService',
      {'serviceConfig': serviceConfig?.toJsonString()},
    )
        .then((result) => result as String)
        .then((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)));
  }

  @override
  Future<ResultModel?> startLocation({
    required ShippingNote? shippingNote,
  }) {
    return methodChannel
        .invokeMethod(
      'startLocation',
      {'shippingNote': shippingNote?.toJsonString()},
    )
        .then((result) => result as String)
        .then((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)));
  }

  @override
  Future<ResultModel?> sendLocation({
    required ShippingNote? shippingNote,
  }) {
    return methodChannel
        .invokeMethod(
      'sendLocation',
      {'shippingNote': shippingNote?.toJsonString()},
    )
        .then((result) => result as String)
        .then((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)));
  }

  @override
  Future<ResultModel?> pauseLocation({
    required ShippingNote? shippingNote,
  }) {
    return methodChannel
        .invokeMethod(
      'pauseLocation',
      {'shippingNote': shippingNote?.toJsonString()},
    )
        .then((result) => result as String)
        .then((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)));
  }

  @override
  Future<ResultModel?> reStartLocation({
    required ShippingNote? shippingNote,
  }) {
    return methodChannel
        .invokeMethod(
      'reStartLocation',
      {'shippingNote': shippingNote?.toJsonString()},
    )
        .then((result) => result as String)
        .then((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)));
  }

  @override
  Future<ResultModel?> stopLocation({
    required ShippingNote? shippingNote,
  }) {
    return methodChannel
        .invokeMethod(
      'stopLocation',
      {'shippingNote': shippingNote?.toJsonString()},
    )
        .then((result) => result as String)
        .then((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)));
  }
}
