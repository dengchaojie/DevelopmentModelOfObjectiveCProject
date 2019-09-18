//
//  ExternString.h
//  DevelopmentModelOfObjectiveCProject
//
//  Created by hrt03 on 2019/9/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import <Foundation/Foundation.h>


#define Production // 生产环境

//#define Uat // 准生产环境

//#define Development // 测试环境



NS_ASSUME_NONNULL_BEGIN

extern NSString* const AppURL;// 后台的域名
extern NSString* const AesKey;// 后台的域名


@interface ExternString : NSObject

@end

NS_ASSUME_NONNULL_END
