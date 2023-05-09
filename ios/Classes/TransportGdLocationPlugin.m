#import "TransportGdLocationPlugin.h"
#import "MJExtension.h"
/// model
#import "ShippingNote.h"
#import "ServiceConfig.h"
#import "ResultModel.h"
/// 导入 SDK
#import <MapManager/MapManager.h>
/// 地图基础
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface TransportGdLocationPlugin()

@property (nonatomic, strong) MapService *mapService;

@end

@implementation TransportGdLocationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"transport_gd_location"
            binaryMessenger:[registrar messenger]];
  TransportGdLocationPlugin* instance = [[TransportGdLocationPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
      result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    }
    else if ([@"initSdk" isEqualToString:call.method]) {
        // 初始化SDK
        [self initSdkMethodCall:call result:result];
    }
     else if ([@"openService" isEqualToString:call.method]) {
         // 授权接口（auth）
         [self openServiceMethodCall:call result:result];
      }
     else if ([@"startLocation" isEqualToString:call.method]) {
         // 开启定位（start）
         [self startLocationMethodCall:call result:result];
      }
     else if ([@"sendLocation" isEqualToString:call.method]) {
         // 发送定位（send）
         [self sendLocationMethodCall:call result:result];
      }
     else if ([@"pauseLocation" isEqualToString:call.method]) {
         // 暂停定位（pause）
         [self pauseLocationMethodCall:call result:result];
      }
     else if ([@"reStartLocation" isEqualToString:call.method]) {
         // 重启定位（restart）
         [self reStartLocationMethodCall:call result:result];
      }
     else if ([@"stopLocation" isEqualToString:call.method]) {
         // 结束定位
         [self stopLocationMethodCall:call result:result];
      }
    else {
      result(FlutterMethodNotImplemented);
    }
}

- (void)initSdkMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        NSLog(@"initSdk 配置信息：%@", call.arguments[@"gdAppKey"]);
        /// 设置高德地图 appkey
        [[AMapServices sharedServices] setEnableHTTPS:YES];
        [AMapServices sharedServices].apiKey = call.arguments[@"gdAppKey"];
        result([NSNumber numberWithBool:true]);
    }
}

- (void)openServiceMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        ServiceConfig *serviceConfig = [ServiceConfig mj_objectWithKeyValues:call.arguments[@"serviceConfig"]];
        NSLog(@"serviceConfig 配置信息：%@", serviceConfig);
        if (serviceConfig) {
            [self.mapService openServiceWithAppId:serviceConfig.appId appSecurity:serviceConfig.appSecurity enterpriseSenderCode:serviceConfig.enterpriseSenderCode environment:serviceConfig.environment listener:^(id  _Nonnull model) {
                [self resultMethodCall:call result:result data:model];
            }];
        }
    }
}

- (void)startLocationMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        ShippingNote *sippingNote = [ShippingNote mj_objectWithKeyValues:call.arguments[@"shippingNote"]];
        NSLog(@"%@ = Flutter传递的信息：%@", call.method, sippingNote);
        if (sippingNote) {
            [self.mapService startLocationWithShippingNoteInfos:sippingNote.shippingNoteInfos driverNameView:sippingNote.driverName vehicleNumberView:sippingNote.vehicleNumber remark:sippingNote.remark listener:^(id  _Nonnull model) {
                [self resultMethodCall:call result:result data:model];
            }];
        }
    }
}

- (void)sendLocationMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        ShippingNote *sippingNote = [ShippingNote mj_objectWithKeyValues:call.arguments[@"shippingNote"]];
        NSLog(@"%@ = Flutter传递的信息：%@", call.method, sippingNote);
        if (sippingNote) {
            [self.mapService sendLocationWithShippingNoteInfos:sippingNote.shippingNoteInfos driverNameView:sippingNote.driverName vehicleNumberView:sippingNote.vehicleNumber remark:sippingNote.remark listener:^(id  _Nonnull model) {
                [self resultMethodCall:call result:result data:model];
            }];
        }
    }
}

- (void)pauseLocationMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        ShippingNote *sippingNote = [ShippingNote mj_objectWithKeyValues:call.arguments[@"shippingNote"]];
        NSLog(@"%@ = Flutter传递的信息：%@", call.method, sippingNote);
        if (sippingNote) {
            [self.mapService pauseLocationWithShippingNoteInfos:sippingNote.shippingNoteInfos driverNameView:sippingNote.driverName vehicleNumberView:sippingNote.vehicleNumber remark:sippingNote.remark listener:^(id  _Nonnull model) {
                [self resultMethodCall:call result:result data:model];
            }];
        }
    }
}

- (void)reStartLocationMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        ShippingNote *sippingNote = [ShippingNote mj_objectWithKeyValues:call.arguments[@"shippingNote"]];
        NSLog(@"%@ = Flutter传递的信息：%@", call.method, sippingNote);
        if (sippingNote) {
            [self.mapService reStartLocationWithShippingNoteInfos:sippingNote.shippingNoteInfos driverNameView:sippingNote.driverName vehicleNumberView:sippingNote.vehicleNumber remark:sippingNote.remark listener:^(id  _Nonnull model) {
                [self resultMethodCall:call result:result data:model];
            }];
        }
    }
}

- (void)stopLocationMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments) {
        ShippingNote *sippingNote = [ShippingNote mj_objectWithKeyValues:call.arguments[@"shippingNote"]];
        NSLog(@"%@ = Flutter传递的信息：%@", call.method, sippingNote);
        if (sippingNote) {
            [self.mapService stopLocationWithShippingNoteInfos:sippingNote.shippingNoteInfos driverNameView:sippingNote.driverName vehicleNumberView:sippingNote.vehicleNumber remark:sippingNote.remark listener:^(id  _Nonnull model) {
                [self resultMethodCall:call result:result data:model];
            }];
        }
    }
}

- (void)resultMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result data:(id)model {
    ResultModel *rModel = [ResultModel mj_objectWithKeyValues: model];
    NSLog(@"%@ 结果返回：%@", call.method, [rModel mj_JSONString]);
    result([rModel mj_JSONString]);
}

// 懒加载
- (MapService *)mapService {
    if (!_mapService) {
        _mapService = [[MapService alloc] init];
    }
    return _mapService;
}

@end
