//
//  ServiceConfig.h
//  gd_location
//
//  Created by 胡凯 on 2023/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceConfig : NSObject

/// 企业平台
@property (nonatomic, strong) NSString *appId;

/// 企业平台
@property (nonatomic, strong) NSString *appSecurity;

/// 企业唯一标识
@property (nonatomic, strong) NSString *enterpriseSenderCode;

/// 环境:“debug”测试， “release”正式 environment
@property (nonatomic, strong) NSString *environment;

@end

NS_ASSUME_NONNULL_END
