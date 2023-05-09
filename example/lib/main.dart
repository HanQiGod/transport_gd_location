import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:transport_gd_location/transport_gd_location.dart';

import 'package:transport_gd_location/model/result_model.dart';
import 'package:transport_gd_location/model/service_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _transportGdLocationPlugin = TransportGdLocation();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    initSdk();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _transportGdLocationPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initSdk() async {
    bool success;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      success = await _transportGdLocationPlugin.initSdk(gdAppKey: "sdfsdf") ?? false;
    } on PlatformException {
      success = false;
    }
    print("初始化 - 结果 = $success");
  }

  Future<void> openService() async {
    ResultModel? resultModel;
    try {
      ServiceConfig serviceConfig = ServiceConfig(
        appId: Platform.isAndroid
            ? "com.hswl.transport_gd_location.transport_gd_location_example"
            : "com.hswl.transportgdlocation.transportGdLocationExample",
        appSecurity: Platform.isAndroid
            ? "cd5a822984cd48c3a9a92c09e0868cb6b137e6bf336d456fa1b7696308449f05"
            : "fd6a81f2a41b4ea891269067e7eb4b68299ca62797ab4c348274f13d84d580bc",
        enterpriseSenderCode: "10002",
        environment: "debug",
      );
      resultModel =
      await _transportGdLocationPlugin.openService(serviceConfig: serviceConfig);
    } catch (e) {
      resultModel = null;
    }
    print("授权 - 结果 = ${resultModel?.toJson()}");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
