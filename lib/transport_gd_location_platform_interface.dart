import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'transport_gd_location_method_channel.dart';

abstract class TransportGdLocationPlatform extends PlatformInterface {
  /// Constructs a TransportGdLocationPlatform.
  TransportGdLocationPlatform() : super(token: _token);

  static final Object _token = Object();

  static TransportGdLocationPlatform _instance = MethodChannelTransportGdLocation();

  /// The default instance of [TransportGdLocationPlatform] to use.
  ///
  /// Defaults to [MethodChannelTransportGdLocation].
  static TransportGdLocationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TransportGdLocationPlatform] when
  /// they register themselves.
  static set instance(TransportGdLocationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
