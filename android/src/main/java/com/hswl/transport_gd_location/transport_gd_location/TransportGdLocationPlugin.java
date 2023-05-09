package com.hswl.transport_gd_location.transport_gd_location;

import androidx.annotation.NonNull;

import com.alibaba.fastjson.JSONObject;
import com.hdgq.locationlib.LocationOpenApi;
import android.app.Application;
import android.content.Context;
import com.alibaba.fastjson.JSON;
import com.hdgq.locationlib.entity.ShippingNoteInfo;
import com.hdgq.locationlib.listener.OnResultListener;
import com.hdgq.locationlib.listener.OnSendResultListener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/** TransportGdLocationPlugin */
public class TransportGdLocationPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private Context mContext;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "gd_location");
    mContext = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("initSdk")) {
      LocationOpenApi.init((Application) mContext);
      result.success(true);
    }else if (call.method.equals("openService")) {
      String jsonStr = call.argument("serviceConfig");
      JSONObject jsonObject = JSONObject.parseObject(jsonStr);
      LocationOpenApi.auth(mContext,
              (String) jsonObject.get("appId"),
              (String) jsonObject.get("appSecurity"),
              (String) jsonObject.get("enterpriseSenderCode"),
              (String) jsonObject.get("environment"),
              new OnResultListener() {
                @Override
                public void onFailure(String s, String s1) {
                  Map map=new HashMap();
                  map.put("code",Integer.parseInt(s));
                  map.put("fail",s1);
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }

                @Override
                public void onSuccess(List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",0);
                  map.put("message","成功");
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }
              });

    }else if (call.method.equals("startLocation")) {
      String jsonStr = call.argument("shippingNote");
      JSONObject jsonObject = JSONObject.parseObject(jsonStr);
      LocationOpenApi.start(mContext,
              (String) jsonObject.get("vehicleNumber"),
              (String) jsonObject.get("driverName"),
              (String) jsonObject.get("remark"),
              (ShippingNoteInfo[]) jsonObject.get("shippingNoteInfos"),
              new OnResultListener() {
                @Override
                public void onFailure(String s, String s1) {
                  Map map=new HashMap();
                  map.put("code",Integer.parseInt(s));
                  map.put("fail",s1);
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }

                @Override
                public void onSuccess(List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",0);
                  map.put("message","成功");
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }
              });
    }else if (call.method.equals("sendLocation")) {
      String jsonStr = call.argument("shippingNote");
      JSONObject jsonObject = JSONObject.parseObject(jsonStr);
      LocationOpenApi.send(mContext,
              (String) jsonObject.get("vehicleNumber"),
              (String) jsonObject.get("driverName"),
              (String) jsonObject.get("remark"),
              (ShippingNoteInfo[]) jsonObject.get("shippingNoteInfos"),
              new OnSendResultListener() {
                @Override
                public void onFailure(String s, String s1, List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",Integer.parseInt(s));
                  map.put("fail",s1);
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }

                @Override
                public void onSuccess(List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",0);
                  map.put("message","成功");
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }
              });
    }else if (call.method.equals("pauseLocation")) {
      String jsonStr = call.argument("shippingNote");
      JSONObject jsonObject = JSONObject.parseObject(jsonStr);
      LocationOpenApi.pause(mContext,
              (String) jsonObject.get("vehicleNumber"),
              (String) jsonObject.get("driverName"),
              (String) jsonObject.get("remark"),
              (ShippingNoteInfo[]) jsonObject.get("shippingNoteInfos"),
              new OnResultListener() {
                @Override
                public void onFailure(String s, String s1) {
                  Map map=new HashMap();
                  map.put("code",Integer.parseInt(s));
                  map.put("fail",s1);
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }

                @Override
                public void onSuccess(List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",0);
                  map.put("message","成功");
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }
              });
    }else if (call.method.equals("reStartLocation")) {
      String jsonStr = call.argument("shippingNote");
      JSONObject jsonObject = JSONObject.parseObject(jsonStr);
      LocationOpenApi.restart(mContext,
              (String) jsonObject.get("vehicleNumber"),
              (String) jsonObject.get("driverName"),
              (String) jsonObject.get("remark"),
              (ShippingNoteInfo[]) jsonObject.get("shippingNoteInfos"),
              new OnResultListener() {
                @Override
                public void onFailure(String s, String s1) {
                  Map map=new HashMap();
                  map.put("code",Integer.parseInt(s));
                  map.put("fail",s1);
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }

                @Override
                public void onSuccess(List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",0);
                  map.put("message","成功");
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }
              });
    }else if (call.method.equals("stopLocation")) {
      String jsonStr = call.argument("shippingNote");
      JSONObject jsonObject = JSONObject.parseObject(jsonStr);
      LocationOpenApi.stop(mContext,
              (String) jsonObject.get("vehicleNumber"),
              (String) jsonObject.get("driverName"),
              (String) jsonObject.get("remark"),
              (ShippingNoteInfo[]) jsonObject.get("shippingNoteInfos"),
              new OnResultListener() {
                @Override
                public void onFailure(String s, String s1) {
                  Map map=new HashMap();
                  map.put("code",Integer.parseInt(s));
                  map.put("fail",s1);
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }

                @Override
                public void onSuccess(List<ShippingNoteInfo> list) {
                  Map map=new HashMap();
                  map.put("code",0);
                  map.put("message","成功");
                  String jsonStr = JSONObject.toJSONString(map);
                  result.success(jsonStr);
                }
              });
    }else{
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
