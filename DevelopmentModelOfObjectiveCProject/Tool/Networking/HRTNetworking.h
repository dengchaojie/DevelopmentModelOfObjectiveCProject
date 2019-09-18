//
//  HRTNetworking.h

/*
 ====================================================================================================================
 ============================================线下收单================================================================
 ====================================================================================================================
 */
#import <AFNetworking/AFNetworking.h>

@interface HRTNetworking : AFHTTPSessionManager

+(HRTNetworking *)shared;

/*
 url  url
 parame 参数
 errorInfoStr 失败原因（会用SVP显示  传nil会不显示）
 success  成功回调
 failure  失败回调
 */
- (NSURLSessionDataTask *)postPath:(NSString *)url parameters:(NSDictionary *)parame errInfo:(NSString *)errorInfoStr success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure;

- (NSURLSessionDataTask *)imagePostPath:(NSString *)url parameters:(NSDictionary *)dic imageData:(NSData *)data errInfo:(NSString *)errorInfoStr success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure;


@end
