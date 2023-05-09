import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'transport_gd_location_platform_interface.dart';

/// An implementation of [TransportGdLocationPlatform] that uses method channels.
class MethodChannelTransportGdLocation extends TransportGdLocationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('transport_gd_location');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
