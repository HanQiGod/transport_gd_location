import 'package:flutter_test/flutter_test.dart';
import 'package:transport_gd_location/transport_gd_location.dart';
import 'package:transport_gd_location/transport_gd_location_platform_interface.dart';
import 'package:transport_gd_location/transport_gd_location_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTransportGdLocationPlatform
    with MockPlatformInterfaceMixin
    implements TransportGdLocationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
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
