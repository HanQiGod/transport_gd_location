import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/result_model.dart';
import 'model/service_config.dart';
import 'model/shipping_note.dart';
import 'transport_gd_location_method_channel.dart';

abstract class TransportGdLocationPlatform extends PlatformInterface {
  /// Constructs a GdLocationPlatform.
  TransportGdLocationPlatform() : super(token: _token);

  static final Object _token = Object();

  static TransportGdLocationPlatform _instance = MethodChannelTransportGdLocation();

  /// The default instance of [GdLocationPlatform] to use.
  ///
  /// Defaults to [MethodChannelGdLocation].
  static TransportGdLocationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GdLocationPlatform] when
  /// they register themselves.
  static set instance(TransportGdLocationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> initSdk({String? gdAppKey}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResultModel?> openService({required ServiceConfig? serviceConfig}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResultModel?> startLocation({required ShippingNote? shippingNote}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResultModel?> sendLocation({required ShippingNote? shippingNote}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResultModel?> pauseLocation({required ShippingNote? shippingNote}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResultModel?> reStartLocation({required ShippingNote? shippingNote}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ResultModel?> stopLocation({required ShippingNote? shippingNote}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
