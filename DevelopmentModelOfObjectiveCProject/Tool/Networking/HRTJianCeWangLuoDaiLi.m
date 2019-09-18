//
//  HRTJianCeWangLuoDaiLi.m
//  merchant
//
//  Created by Deng Chaojie on 2017/8/31.
//  Copyright © 2017年 Hrtpayment. All rights reserved.
//

#import "HRTJianCeWangLuoDaiLi.h"

@implementation HRTJianCeWangLuoDaiLi

+ (BOOL)getProxyStatus {
    NSDictionary *proxySettings = (__bridge NSDictionary *)(CFNetworkCopySystemProxySettings());
    NSArray *proxies = (__bridge NSArray *)(CFNetworkCopyProxiesForURL((__bridge CFURLRef _Nonnull)([NSURL URLWithString:@"https://www.baidu.com"]), (__bridge CFDictionaryRef _Nonnull)(proxySettings)));
//    HRTLog(@"\n%@",proxies);
    
    NSDictionary *settings = proxies[0];
//    HRTLog(@"%@",[settings objectForKey:(NSString *)kCFProxyHostNameKey]);
//    HRTLog(@"%@",[settings objectForKey:(NSString *)kCFProxyPortNumberKey]);
//    HRTLog(@"%@",[settings objectForKey:(NSString *)kCFProxyTypeKey]);
    
    if ([[settings objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:@"kCFProxyTypeNone"])
    {
//        HRTLog(@"没代理");
        return NO;
    }
    else
    {
//        HRTLog(@"设置了代理");
//        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"为了您的账户资金安全，请关闭接入WiFi的HTTP代理" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alertV show];
        return YES;
    }
}
@end
