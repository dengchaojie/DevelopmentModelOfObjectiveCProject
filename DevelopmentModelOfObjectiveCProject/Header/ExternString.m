//
//  ExternString.m
//  DevelopmentModelOfObjectiveCProject
//
//  Created by hrt03 on 2019/9/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ExternString.h"

#ifdef Production
NSString* const AppURL = @"https://www.baidu.com/";
NSString* const AesKey = @"ieii32k00dukj2pkdkj";


#elif defined Uat
NSString* const AppURL = @"https://test.baidu.com/";
NSString* const AesKey = @"ieii32k00dukj2pkdkj";

#elif defined Development
NSString* const AppURL = @"http://10.51.132.121:7070/";
NSString* const AesKey = @"iiejkkslkw";

#endif



@implementation ExternString

@end
