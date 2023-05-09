//
//  MapService.h
//  gangxinbao
//
//  Created by 王俊杰的Mac mini on 2019/11/6.
//  Copyright © 2019 wangjunjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MSdebug @"debug"
#define MSrelease @"release"
NS_ASSUME_NONNULL_BEGIN
typedef void(^MapServiceBlock)(NSObject *object);
@interface MapService : NSObject
@property (nonatomic, copy) MapServiceBlock block;

/// 开启服务，开启持续定位
/// @param appId 企业平台appId
/// @param appSecurity 企业平台appSecurity
/// @param enterpriseSenderCode 企业唯一标识
/// @param environment 环境：“debug”测试，“release”正式
/// @param listener 返回结果回调函数
-(void)openServiceWithAppId:(NSString *)appId appSecurity:(NSString *)appSecurity enterpriseSenderCode:(NSString *)enterpriseSenderCode environment:(NSString *)environment listener:(void(^)(id model))listener;

/// 开始上传定位
/// @param shippingNoteInfos 运单信息数组
/// @param driverNameView 司机姓名
/// @param vehicleNumberView 车牌号
/// @param listener 返回结果回调函数
-(void)startLocationWithShippingNoteInfos:(NSArray *)shippingNoteInfos driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView remark:(NSString*)remark listener:(void(^)(id model))listener;

/// 重启上传定位
/// @param shippingNoteInfos 运单信息数组
/// @param driverNameView 司机姓名
/// @param vehicleNumberView 车牌号
/// @param listener 返回结果回调函数
-(void)reStartLocationWithShippingNoteInfos:(NSArray *)shippingNoteInfos driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView remark:(NSString*)remark listener:(void(^)(id model))listener;


/// 上传定位
/// @param shippingNoteInfos 运单信息数组
/// @param driverNameView 司机姓名
/// @param vehicleNumberView 车牌号
/// @param listener 返回结果回调函数
-(void)sendLocationWithShippingNoteInfos:(NSArray *)shippingNoteInfos driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView remark:(NSString*)remark listener:(void(^)(id model))listener;

/// 停止上传定位
/// @param shippingNoteInfos 运单信息数组
/// @param driverNameView 司机姓名
/// @param vehicleNumberView 车牌号
/// @param listener 返回结果回调函数
-(void)stopLocationWithShippingNoteInfos:(NSArray *)shippingNoteInfos driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView remark:(NSString*)remark listener:(void(^)(id model))listener;

/// 暂停上传定位
/// @param shippingNoteInfos 运单信息数组
/// @param driverNameView 司机姓名
/// @param vehicleNumberView 车牌号
/// @param listener 返回结果回调函数
-(void)pauseLocationWithShippingNoteInfos:(NSArray *)shippingNoteInfos driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView remark:(NSString*)remark listener:(void(^)(id model))listener;


@end

NS_ASSUME_NONNULL_END
