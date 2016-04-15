//
//  CYHTTPClient.m
//  MoneyJar2
//
//  Created by HuangQiSheng on 15/6/6.
//  Copyright (c) 2015年 GK. All rights reserved.
//

#import "CYHTTPClient.h"

#import "AFNetworking.h"
#import "NSDictionary+CYJson.h"

@interface CYHTTPClient ()

//@property (nonatomic, strong) AFHttp
@property (nonatomic, strong) NSURL *baseURL;

@end

static NSMutableDictionary *clients = nil;

@implementation CYHTTPClient

+ (instancetype)clientWithBaseURLString:(NSString *)baseURLString {
    
    if (!baseURLString
        || (NSNull *)baseURLString == [NSNull null]
        || [@"" isEqualToString:baseURLString]) {
        
        return [[CYHTTPClient alloc] init];
    }
    
    __block CYHTTPClient *client = nil;
    
    if (!clients) {
        
        clients = [NSMutableDictionary dictionary];
    }
    client = [clients objectForKey:baseURLString];
    if (!client) {
        
        client = [[CYHTTPClient alloc] init];
        client.baseURL = [NSURL URLWithString:baseURLString];
        [clients setObject:client forKey:baseURLString];
    }
    return client;
}

+ (BOOL)networkReachable {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    BOOL isReachable = [[AFNetworkReachabilityManager sharedManager] isReachable];
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
    return isReachable;
}

#pragma mark - request
- (void)sendAsynPostRequestWithPath:(NSString *)path
                             params:(NSDictionary *)params
                         completion:(CYHTTPClientRequestCompletion)completion {
    
    [self sendAsynPostRequestWithPath:path
                              headers:nil
                               params:params
                           completion:completion];
}

- (void)sendAsynPostRequestWithPath:(NSString *)path
                            headers:(NSDictionary *)headers
                             params:(NSDictionary *)params
                         completion:(CYHTTPClientRequestCompletion)completion {
    
    NSString *urlString = nil;
    if (!self.baseURL) {
        
        urlString = path;
    } else {
        
        urlString = [NSURL URLWithString:path relativeToURL:self.baseURL].absoluteString;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    [manager POST:urlString
       parameters:params
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSDictionary *responseDic = nil;
              if ([responseObject isKindOfClass:[NSDictionary class]]) {
                  
                  responseDic = responseObject;
              } else if ([responseObject isKindOfClass:[NSData class]]) {
                  
                  responseDic = [NSDictionary cy_dictionaryFromJsonData:responseObject];
              } else if ([responseObject isKindOfClass:[NSString class]]) {
                  
                  responseDic = [NSDictionary cy_dictionaryFromJsonString:responseObject];
              }
              if (completion) {
                  
                  completion(responseDic, nil);
              }
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              if (completion) {
                  
                  completion(nil, error);
              }
          }];
}

- (void)sendAsynUploadFileWithPath:(NSString *)path
                            params:(NSDictionary *)params
                          fileData:(NSData *)fileData
                     fileParamName:(NSString *)fileParamName
                          fileName:(NSString *)fileName
                          mimeType:(NSString *)mimeType
                          progress:(CYHTTPClientRequestProgress)progress
                        completion:(CYHTTPClientRequestCompletion)completion {
    
    NSString *urlString = nil;
    if (!self.baseURL) {
        
        urlString = path;
    } else {
        
        urlString = [NSURL URLWithString:path relativeToURL:self.baseURL].absoluteString;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:fileData
                                    name:fileParamName
                                fileName:fileName
                                mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *responseDic = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            responseDic = responseObject;
        } else if ([responseObject isKindOfClass:[NSData class]]) {
            
            responseDic = [NSDictionary cy_dictionaryFromJsonData:responseObject];
        } else if ([responseObject isKindOfClass:[NSString class]]) {
            
            responseDic = [NSDictionary cy_dictionaryFromJsonString:responseObject];
        }
        if (completion) {
            
            completion(responseDic, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (completion) {
            
            completion(nil, error);
        }
    }];
}

+ (void)sendAsynDownloadFileRequestWithUrl:(NSString *)url
                                    params:(NSDictionary *)params
                                completion:(CYHTTPClientDownloadCompletion)completion {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (completion) {
            
            NSDictionary *responseDic = nil;
            NSData *responseData = nil;
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                responseDic = responseObject;
            } else if ([responseObject isKindOfClass:[NSData class]]) {
                
                responseData = responseObject;
            }
            completion(responseDic, responseData, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (completion) {
            
            completion(nil, nil, error);
        }
    }];
}

@end
