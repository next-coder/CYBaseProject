//
//  CYHTTPClient.h
//  MoneyJar2
//
//  Created by HuangQiSheng on 15/6/6.
//  Copyright (c) 2015年 GK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CYHTTPClientRequestCompletion)(NSDictionary *response, NSError *error);
typedef void (^CYHTTPClientDownloadCompletion)(NSDictionary *responseDic, NSData *responseData, NSError *error);
typedef void (^CYHTTPClientRequestProgress)(NSProgress *progress);

@interface CYHTTPClient : NSObject

- (void)sendAsynPostRequestWithPath:(NSString *)path
                             params:(NSDictionary *)params
                         completion:(CYHTTPClientRequestCompletion)completion;

- (void)sendAsynPostRequestWithPath:(NSString *)path
                            headers:(NSDictionary *)headers
                             params:(NSDictionary *)params
                         completion:(CYHTTPClientRequestCompletion)completion;

- (void)sendAsynUploadFileWithPath:(NSString *)path
                            params:(NSDictionary *)params
                          fileData:(NSData *)fileData
                     fileParamName:(NSString *)fileParamName
                          fileName:(NSString *)fileName
                          mimeType:(NSString *)mimeType
                          progress:(CYHTTPClientRequestProgress)progress
                        completion:(CYHTTPClientRequestCompletion)completion;

+ (void)sendAsynDownloadFileRequestWithUrl:(NSString *)url
                                    params:(NSDictionary *)params
                                completion:(CYHTTPClientDownloadCompletion)completion;

+ (BOOL)networkReachable;
+ (instancetype)clientWithBaseURLString:(NSString *)baseURLString;



@end
