import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_gd_location/transport_gd_location_method_channel.dart';

void main() {
  MethodChannelTransportGdLocation platform = MethodChannelTransportGdLocation();
  const MethodChannel channel = MethodChannel('transport_gd_location');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
