
import 'dart:convert';

class ServiceConfig {
  String? appId; // 网络货运企业App的唯一标识
  String? appSecurity; // 网络货运企业在省平台申请的接入安全码
  String? enterpriseSenderCode; // 网络货运企业在省平台申请的企业发送代码
  String? environment; // 环境:“debug”接入测试环境，“release”接入正式环境

  ServiceConfig({
    this.appId,
    this.appSecurity,
    this.enterpriseSenderCode,
    this.environment,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appId'] = appId;
    map['appSecurity'] = appSecurity;
    map['enterpriseSenderCode'] = enterpriseSenderCode;
    map['environment'] = environment;
    return map;
  }

  String toJsonString() => jsonEncode(toJson());
}