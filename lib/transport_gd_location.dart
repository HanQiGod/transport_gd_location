
import 'transport_gd_location_platform_interface.dart';
import 'model/result_model.dart';
import 'model/service_config.dart';
import 'model/shipping_note.dart';

class TransportGdLocation {
  Future<String?> getPlatformVersion() =>
      TransportGdLocationPlatform.instance.getPlatformVersion();

  // 初始化
  Future<bool?> initSdk({
    String? gdAppKey,
  }) =>
      TransportGdLocationPlatform.instance.initSdk(gdAppKey: gdAppKey);

  // 授权接口（auth）
  // 配置信息 serviceConfig
  // 返回结果回调函数 listener
  Future<ResultModel?> openService({
    required ServiceConfig? serviceConfig,
  }) =>
      TransportGdLocationPlatform.instance.openService(serviceConfig: serviceConfig);

  // 开启定位（start）
  // 运单信息 shippingNote
  // 结果回调函数 listener
  Future<ResultModel?> startLocation({
    required ShippingNote? shippingNote,
  }) =>
      TransportGdLocationPlatform.instance.startLocation(shippingNote: shippingNote);

  // 发送定位（send）
  // 运单信息 shippingNote
  // 返回结果回调函数 listener
  Future<ResultModel?> sendLocation({
    required ShippingNote? shippingNote,
  }) =>
      TransportGdLocationPlatform.instance.sendLocation(shippingNote: shippingNote);

  // 暂停定位（pause）
  // 运单信息 shippingNote
  // 返回结果回调函数 listener
  Future<ResultModel?> pauseLocation({
    required ShippingNote? shippingNote,
  }) =>
      TransportGdLocationPlatform.instance.pauseLocation(shippingNote: shippingNote);

  // 重启定位（restart）
  // 运单信息 shippingNote
  // 结果回调函数 listener
  Future<ResultModel?> reStartLocation({
    required ShippingNote? shippingNote,
  }) =>
      TransportGdLocationPlatform.instance.reStartLocation(shippingNote: shippingNote);

  // 结束定位（stop）
  // 运单信息 shippingNote
  // 结果回调函数 listener
  Future<ResultModel?> stopLocation({
    required ShippingNote? shippingNote,
  }) =>
      TransportGdLocationPlatform.instance.stopLocation(shippingNote: shippingNote);
}