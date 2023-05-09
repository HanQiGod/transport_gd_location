import 'package:flutter_test/flutter_test.dart';
import 'package:transport_gd_location/model/result_model.dart';
import 'package:transport_gd_location/model/service_config.dart';
import 'package:transport_gd_location/model/shipping_note.dart';
import 'package:transport_gd_location/transport_gd_location.dart';
import 'package:transport_gd_location/transport_gd_location_platform_interface.dart';
import 'package:transport_gd_location/transport_gd_location_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTransportGdLocationPlatform
    with MockPlatformInterfaceMixin
    implements TransportGdLocationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> initSdk({String? gdAppKey}) {
    // TODO: implement initSdk
    throw UnimplementedError();
  }

  @override
  Future<ResultModel?> openService({ServiceConfig? serviceConfig, Function(dynamic model)? listener}) {
    // TODO: implement openService
    throw UnimplementedError();
  }

  @override
  Future<ResultModel?> startLocation({ShippingNote? shippingNote, Function(dynamic model)? listener}) {
    // TODO: implement startLocation
    throw UnimplementedError();
  }

  @override
  Future<ResultModel?> stopLocation({ShippingNote? shippingNote, Function(dynamic model)? listener}) {
    // TODO: implement stopLocation
    throw UnimplementedError();
  }

  @override
  Future<ResultModel?> pauseLocation({ShippingNote? shippingNote, Function(dynamic model)? listener}) {
    // TODO: implement pauseLocation
    throw UnimplementedError();
  }

  @override
  Future<ResultModel?> reStartLocation({ShippingNote? shippingNote, Function(dynamic model)? listener}) {
    // TODO: implement reStartLocation
    throw UnimplementedError();
  }

  @override
  Future<ResultModel?> sendLocation({ShippingNote? shippingNote, Function(dynamic model)? listener}) {
    // TODO: implement sendLocation
    throw UnimplementedError();
  }
}

void main() {
  final TransportGdLocationPlatform initialPlatform = TransportGdLocationPlatform.instance;

  test('$MethodChannelTransportGdLocation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTransportGdLocation>());
  });

  test('getPlatformVersion', () async {
    TransportGdLocation transportGdLocationPlugin = TransportGdLocation();
    MockTransportGdLocationPlatform fakePlatform = MockTransportGdLocationPlatform();
    TransportGdLocationPlatform.instance = fakePlatform;

    expect(await transportGdLocationPlugin.getPlatformVersion(), '42');
  });
}
