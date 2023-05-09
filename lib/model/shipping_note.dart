import 'dart:convert';

/// vehicleNumber : "" // 车牌号
/// driverName : "" // 司机姓名
/// shippingNoteInfos : // 运单信息列表，考虑到一车多单的情况，本版 SDK 一辆车运单数最大支持数为 10 条
/// [{"shippingNoteNumber":"","serialNumber":"","startCountrySubdivisionCode":"","endCountrySubdivisionCode":"","startLongitude":"","startLatitude":"","endLongitude":"","endLatitude":"","startLocationText":"","endLocationText":""}]

class ShippingNote {
  ShippingNote({
    String? vehicleNumber,
    String? driverName,
    String? remark,
    List<ShippingNoteInfos>? shippingNoteInfos,
  }) {
    _vehicleNumber = vehicleNumber;
    _driverName = driverName;
    _remark = remark;
    _shippingNoteInfos = shippingNoteInfos;
  }

  ShippingNote.fromJson(dynamic json) {
    _vehicleNumber = json['vehicleNumber'];
    _driverName = json['driverName'];
    if (json['remark'] != null) {
      _remark = json['remark'];
    }
    if (json['shippingNoteInfos'] != null) {
      _shippingNoteInfos = [];
      json['shippingNoteInfos'].forEach((v) {
        _shippingNoteInfos?.add(ShippingNoteInfos.fromJson(v));
      });
    }
  }

  String? _vehicleNumber; // 车牌号
  String? _driverName; // 司机姓名
  String? _remark; // 备注
  List<ShippingNoteInfos>? _shippingNoteInfos; // 运单信息列表

  ShippingNote copyWith({
    String? vehicleNumber,
    String? driverName,
    String? remark,
    List<ShippingNoteInfos>? shippingNoteInfos,
  }) =>
      ShippingNote(
        vehicleNumber: vehicleNumber ?? _vehicleNumber,
        driverName: driverName ?? _driverName,
        remark: remark ?? _remark,
        shippingNoteInfos: shippingNoteInfos ?? _shippingNoteInfos,
      );

  String? get vehicleNumber => _vehicleNumber;

  String? get driverName => _driverName;

  String? get remark => _remark;

  List<ShippingNoteInfos>? get shippingNoteInfos => _shippingNoteInfos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicleNumber'] = _vehicleNumber;
    map['driverName'] = _driverName;
    if (_remark != null) {
      map['remark'] = _remark;
    }
    if (_shippingNoteInfos != null) {
      map['shippingNoteInfos'] =
          _shippingNoteInfos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  String toJsonString() => jsonEncode(toJson());
}

/// shippingNoteNumber : "" // 运单号
/// serialNumber : "" // 分单号
/// startCountrySubdivisionCode : "" // 起点位置行政区划代码，调 用 start/stop/pause/restart 时必填，调用 send 非必填
/// endCountrySubdivisionCode : "" // 到达位置行政区划代码，调 用 start/stop/pause/restart 时 必填，调用 send 非必填
/// startLongitude : "" // 起点位置经度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
/// startLatitude : "" // 起点位置纬度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
/// endLongitude : "" // 到达位置经度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
/// endLatitude : "" // 到达位置纬度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
/// startLocationText : "" // 起点地址文字描述，调用 start/stop/pause/restart 时必 填，调用 send 非必填
/// endLocationText : "" // 到达地址文字描述，调用 start/stop/pause/restart 时必 填，调用 send 非必填

class ShippingNoteInfos {
  ShippingNoteInfos({
    String? shippingNoteNumber,
    String? serialNumber,
    String? startCountrySubdivisionCode,
    String? endCountrySubdivisionCode,
    String? startLongitude,
    String? startLatitude,
    String? endLongitude,
    String? endLatitude,
    String? startLocationText,
    String? endLocationText,
  }) {
    _shippingNoteNumber = shippingNoteNumber;
    _serialNumber = serialNumber;
    _startCountrySubdivisionCode = startCountrySubdivisionCode;
    _endCountrySubdivisionCode = endCountrySubdivisionCode;
    _startLongitude = startLongitude;
    _startLatitude = startLatitude;
    _endLongitude = endLongitude;
    _endLatitude = endLatitude;
    _startLocationText = startLocationText;
    _endLocationText = endLocationText;
  }

  ShippingNoteInfos.fromJson(dynamic json) {
    _shippingNoteNumber = json['shippingNoteNumber'];
    _serialNumber = json['serialNumber'];
    _startCountrySubdivisionCode = json['startCountrySubdivisionCode'];
    _endCountrySubdivisionCode = json['endCountrySubdivisionCode'];
    _startLongitude = json['startLongitude'];
    _startLatitude = json['startLatitude'];
    _endLongitude = json['endLongitude'];
    _endLatitude = json['endLatitude'];
    _startLocationText = json['startLocationText'];
    _endLocationText = json['endLocationText'];
  }

  String? _shippingNoteNumber;
  String? _serialNumber;
  String? _startCountrySubdivisionCode;
  String? _endCountrySubdivisionCode;
  String? _startLongitude;
  String? _startLatitude;
  String? _endLongitude;
  String? _endLatitude;
  String? _startLocationText;
  String? _endLocationText;

  ShippingNoteInfos copyWith({
    String? shippingNoteNumber,
    String? serialNumber,
    String? startCountrySubdivisionCode,
    String? endCountrySubdivisionCode,
    String? startLongitude,
    String? startLatitude,
    String? endLongitude,
    String? endLatitude,
    String? startLocationText,
    String? endLocationText,
  }) =>
      ShippingNoteInfos(
        shippingNoteNumber: shippingNoteNumber ?? _shippingNoteNumber,
        serialNumber: serialNumber ?? _serialNumber,
        startCountrySubdivisionCode:
            startCountrySubdivisionCode ?? _startCountrySubdivisionCode,
        endCountrySubdivisionCode:
            endCountrySubdivisionCode ?? _endCountrySubdivisionCode,
        startLongitude: startLongitude ?? _startLongitude,
        startLatitude: startLatitude ?? _startLatitude,
        endLongitude: endLongitude ?? _endLongitude,
        endLatitude: endLatitude ?? _endLatitude,
        startLocationText: startLocationText ?? _startLocationText,
        endLocationText: endLocationText ?? _endLocationText,
      );

  String? get shippingNoteNumber => _shippingNoteNumber;

  String? get serialNumber => _serialNumber;

  String? get startCountrySubdivisionCode => _startCountrySubdivisionCode;

  String? get endCountrySubdivisionCode => _endCountrySubdivisionCode;

  String? get startLongitude => _startLongitude;

  String? get startLatitude => _startLatitude;

  String? get endLongitude => _endLongitude;

  String? get endLatitude => _endLatitude;

  String? get startLocationText => _startLocationText;

  String? get endLocationText => _endLocationText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shippingNoteNumber'] = _shippingNoteNumber;
    map['serialNumber'] = _serialNumber;
    map['startCountrySubdivisionCode'] = _startCountrySubdivisionCode;
    map['endCountrySubdivisionCode'] = _endCountrySubdivisionCode;
    map['startLongitude'] = _startLongitude;
    map['startLatitude'] = _startLatitude;
    map['endLongitude'] = _endLongitude;
    map['endLatitude'] = _endLatitude;
    map['startLocationText'] = _startLocationText;
    map['endLocationText'] = _endLocationText;
    return map;
  }
}
