import 'dart:convert';

/// code : 0 // 查询编码(错误编码或者成功编码，可在错误编码文档中查看具体含义)
/// data : // 为任意数据类型，可根据实际情况返回
/// {"vehicleNumber":"","driverName":"","shippingNoteNumber":"","serialNumber":"","interval":""}
/// fail : "" // 错误描述
/// message : "" // 错误提示信息

class ResultModel {
  ResultModel({
    num? code,
    Data? data,
    String? fail,
    String? message,
  }) {
    _code = code;
    _data = data;
    _fail = fail;
    _message = message;
  }

  ResultModel.fromJson(dynamic json) {
    _code = json['code'] is String ? num.parse(json['code']) : json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _fail = json['fail'];
    _message = json['message'];
  }

  num? _code;
  Data? _data;
  String? _fail;
  String? _message;

  ResultModel copyWith({
    num? code,
    Data? data,
    String? fail,
    String? message,
  }) =>
      ResultModel(
        code: code ?? _code,
        data: data ?? _data,
        fail: fail ?? _fail,
        message: message ?? _message,
      );

  num? get code => _code;

  Data? get data => _data;

  String? get fail => _fail;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['fail'] = _fail;
    map['message'] = _message;
    return map;
  }

  String toJsonString() => jsonEncode(toJson());
}

/// vehicleNumber : "" // 车牌号
/// driverName : "" // 司机姓名
/// shippingNoteNumber : "" // 运单号
/// serialNumber : "" // 分单号
/// interval : "" // 定位间隔时间(单位 ms)

class Data {
  Data({
    String? vehicleNumber,
    String? driverName,
    String? shippingNoteNumber,
    String? serialNumber,
    String? interval,
  }) {
    _vehicleNumber = vehicleNumber;
    _driverName = driverName;
    _shippingNoteNumber = shippingNoteNumber;
    _serialNumber = serialNumber;
    _interval = interval;
  }

  Data.fromJson(dynamic json) {
    _vehicleNumber = json['vehicleNumber'];
    _driverName = json['driverName'];
    _shippingNoteNumber = json['shippingNoteNumber'];
    _serialNumber = json['serialNumber'];
    _interval = json['interval'];
  }

  String? _vehicleNumber;
  String? _driverName;
  String? _shippingNoteNumber;
  String? _serialNumber;
  String? _interval;

  Data copyWith({
    String? vehicleNumber,
    String? driverName,
    String? shippingNoteNumber,
    String? serialNumber,
    String? interval,
  }) =>
      Data(
        vehicleNumber: vehicleNumber ?? _vehicleNumber,
        driverName: driverName ?? _driverName,
        shippingNoteNumber: shippingNoteNumber ?? _shippingNoteNumber,
        serialNumber: serialNumber ?? _serialNumber,
        interval: interval ?? _interval,
      );

  String? get vehicleNumber => _vehicleNumber;

  String? get driverName => _driverName;

  String? get shippingNoteNumber => _shippingNoteNumber;

  String? get serialNumber => _serialNumber;

  String? get interval => _interval;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicleNumber'] = _vehicleNumber;
    map['driverName'] = _driverName;
    map['shippingNoteNumber'] = _shippingNoteNumber;
    map['serialNumber'] = _serialNumber;
    map['interval'] = _interval;
    return map;
  }
}
