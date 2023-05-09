//
//  MapServicePri.h
//  HondenMapService
//
//  Created by work-cn on 2021/9/6.
//  Copyright © 2021 王俊杰的Mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MSdebug @"debug"
#define MSrelease @"release"

NS_ASSUME_NONNULL_BEGIN

@interface MapServicePri : NSObject

//经度
@property(nonatomic,copy)NSString * lon;
//纬度
@property(nonatomic,copy)NSString * lat;
//行政区划代码
@property(nonatomic,copy)NSString * countryCode;
//地址信息
@property(nonatomic,copy)NSString * location;

- (void)openServiceWithAppId:(NSString *)appId appSecurity:(NSString *)appSecurity enterpriseSenderCode:(NSString *)enterpriseSenderCode environment:(NSString *)environment listener:(void(^)(id model))listener;

-(void)uploadLocationInfoWithLocationType:(NSString *)locationType driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView shippingNoteInfos:(NSArray *)shippingNoteInfos remark:(NSString*)remark listener:(void(^)(id model))listener num:(NSInteger)num;

-(void)uploadLocationInfoWithLocationType:(NSString *)locationType driverNameView:(NSString*)driverNameView vehicleNumberView:(NSString*)vehicleNumberView shippingNoteInfos:(NSArray *)shippingNoteInfos urlInfoList:(NSMutableArray *)urlInfoList remark:(NSString*)remark listener:(void(^)(id model))listener num:(NSInteger)num;

@end

NS_ASSUME_NONNULL_END
