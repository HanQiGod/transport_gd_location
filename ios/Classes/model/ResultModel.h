//
//  ResultModel.h
//  gd_location
//
//  Created by 胡凯 on 2023/5/5.
//

#import <Foundation/Foundation.h>

@class ResultData;

NS_ASSUME_NONNULL_BEGIN

@interface ResultModel : NSObject

/// 查询编码(错误编码或者成功编码，可在错误编码文档中查看具体含义)
@property (nonatomic, assign) NSInteger code;

/// 为任意数据类型，可根据实际情况返回
@property (nonatomic, retain) ResultData *data;

/// 错误描述
@property (nonatomic, strong) NSString *fail;

/// 错误提示信息
@property (nonatomic, strong) NSString *message;


@end


@interface ResultData : NSObject

/// 车牌号
@property (nonatomic, strong) NSString *vehicleNumber;

/// 司机姓名
@property (nonatomic, strong) NSString *driverName;

/// 运单号
@property (nonatomic, strong) NSString *shippingNoteNumber;

/// 分单号
@property (nonatomic, strong) NSString *serialNumber;

/// 定位间隔时间(单位 ms)
@property (nonatomic, strong) NSString *interval;

@end

NS_ASSUME_NONNULL_END
