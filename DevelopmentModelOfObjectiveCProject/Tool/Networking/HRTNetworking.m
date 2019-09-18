//
//  HRTNetworking.m


#import "HRTNetworking.h"
#import "HRTJianCeWangLuoDaiLi.h"

// 报单后台返回的contentType是text/html
#define KHRTContentTypes ([NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",@"image/png", nil])

@implementation HRTNetworking

static HRTNetworking *_sharedClient = nil;
+(HRTNetworking *)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[HRTNetworking alloc] initWithBaseURL:[NSURL URLWithString: AppURL]];
        AFJSONResponseSerializer *jsonResponse = [AFJSONResponseSerializer serializer];
        jsonResponse.removesKeysWithNullValues = true;
        jsonResponse.acceptableContentTypes = KHRTContentTypes;

        _sharedClient.responseSerializer = jsonResponse;
    });

    return _sharedClient;
}

#pragma mark - POST请求
- (NSURLSessionDataTask *)postPath:(NSString *)url parameters:(NSDictionary *)parame errInfo:(NSString *)errorInfoStr success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure
{
    if ([HRTJianCeWangLuoDaiLi getProxyStatus]) {
        failure([[NSError alloc] init]);
        return nil;
    }

#ifdef Debug
    if (parame) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:parame options:(NSJSONWritingPrettyPrinted) error:&error];
        NSString *strPara = [[NSString alloc] initWithData:data encoding:(NSUTF8StringEncoding)];
        NSLog(@"\nrequest == %@ == \n%@",url, strPara);
    }
#endif
    NSURLSessionDataTask *dataTask = [self POST:url parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
#ifdef Debug
         NSError *errorRes;
         NSData *dataRes = [NSJSONSerialization dataWithJSONObject:responseObject options:(NSJSONWritingPrettyPrinted) error:&errorRes];
         NSString *strParaRes = [[NSString alloc] initWithData:dataRes encoding:(NSUTF8StringEncoding)];
         NSLog(@"\nresponse == %@ == \n%@",url, strParaRes);
#endif
         success(responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         failure(error);
         if (error.code == -999)
         {
             
         }else
         {

#ifdef Debug
             NSLog(@"\nresponse == %@ == \n%@",url,error.description);
#endif
         }
     }];
    
    [self addDataTaskToArrWith:dataTask];
    return dataTask;
    
    
}

- (NSURLSessionDataTask *)imagePostPath:(NSString *)url parameters:(NSDictionary *)dic imageData:(NSData *)data errInfo:(NSString *)errorInfoStr success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure
{
    if ([HRTJianCeWangLuoDaiLi getProxyStatus]) {
        failure([[NSError alloc] init]);
        return nil;
    }
#ifdef Debug
    if (dic) {
        NSError *error;
        NSData *dataReq = [NSJSONSerialization dataWithJSONObject:dic options:(NSJSONWritingPrettyPrinted) error:&error];
        NSString *strPara = [[NSString alloc] initWithData:dataReq encoding:(NSUTF8StringEncoding)];
        NSLog(@"\nrequest == %@ == \n%@",url, strPara);
    }
#endif
    NSString *dataName = dic[@"dataName"];// 适用于报单后台指定图片名，dcj;如果后台指定了data的名字，用key：dataName存到字典传到这里
    
    if (!dataName)
        dataName = @"aphoto";
    
    NSDateFormatter *formatter = [[NSDateFormatter  alloc ]  init ];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *today = [NSDate date];
    NSString *todayTime = [formatter stringFromDate:today];
    NSString *fileName = [NSString stringWithFormat:@"%@.png",todayTime];
    
    NSURLSessionDataTask *dataTask = [self POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
     {
         [formData appendPartWithFileData:data
                                     name:dataName
                                 fileName:fileName
                                 mimeType:@"image/png"];
     }
      progress:^(NSProgress * _Nonnull uploadProgress)
     {
         
     }
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
#ifdef Debug
         NSError *errorRes;
         NSData *dataRes = [NSJSONSerialization dataWithJSONObject:responseObject options:(NSJSONWritingPrettyPrinted) error:&errorRes];
         NSString *strParaRes = [[NSString alloc] initWithData:dataRes encoding:(NSUTF8StringEncoding)];
         NSLog(@"\nresponse == %@ == \n%@",url, strParaRes);
#endif
         success(responseObject);
     }
       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         failure(error);
         if (error.code == -999)
         {
             
         }else
         {

#ifdef Debug
             NSLog(@"\nresponse == %@ == \n%@",url,error.description);
#endif

         }
         
     }];
     [self addDataTaskToArrWith:dataTask];
    return dataTask;
    
}

- (void)addDataTaskToArrWith:(NSURLSessionDataTask *)dataTask
{
//    UIViewController *vc = [Tools getCurrentVC];
//    if ([vc isKindOfClass:[POSCustomViewController class]])
//    {
//        POSCustomViewController *posVC = (POSCustomViewController *)vc;
//        [posVC.arrAFNetWorkingRequest addObject:dataTask];
//    }
}


@end
