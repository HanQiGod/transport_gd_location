//
//  ShippingNote.h
//  gd_location
//
//  Created by 胡凯 on 2023/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShippingNote : NSObject

/// 车牌号
@property (nonatomic, strong) NSString *vehicleNumber;

/// 司机姓名
@property (nonatomic, strong) NSString *driverName;

/// 备注
@property (nonatomic, strong) NSString *remark;

/// 运单信息列表
@property (nonatomic, strong) NSArray<ShippingNote *> *shippingNoteInfos;

@end




@interface ShippingNoteInfo : NSObject

/// 运单号
@property (nonatomic, strong) NSString *shippingNoteNumber;

/// 分单号
@property (nonatomic, strong) NSString *serialNumber;

/// 起点位置行政区划代码，调 用 start/stop/pause/restart 时必填，调用 send 非必填
@property (nonatomic, strong) NSString *startCountrySubdivisionCode;

/// 到达位置行政区划代码，调 用 start/stop/pause/restart 时 必填，调用 send 非必填
@property (nonatomic, strong) NSString *endCountrySubdivisionCode;

/// 起点位置经度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
@property (nonatomic, strong) NSString *startLongitude;

/// 起点位置纬度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
@property (nonatomic, strong) NSString *startLatitude;

/// 到达位置经度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
@property (nonatomic, strong) NSString *endLongitude;

/// 到达位置纬度，调用 start/stop/pause/restart 时必 填，调用 send 非必填
@property (nonatomic, strong) NSString *endLatitude;

/// 起点地址文字描述，调用 start/stop/pause/restart 时必 填，调用 send 非必填
@property (nonatomic, strong) NSString *startLocationText;

/// 到达地址文字描述，调用 start/stop/pause/restart 时必 填，调用 send 非必填
@property (nonatomic, strong) NSString *endLocationText;

@end

NS_ASSUME_NONNULL_END
