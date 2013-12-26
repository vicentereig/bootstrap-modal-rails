//
//  SessionClient.m
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "SessionService.h"
#import "AFNetworking/AFNetworking.h"

#define HTTP_FORBIDEN 403
#define HTTP_SERVER_ERROR 500

@implementation SessionService
+ authenticateUser:(NSString*)email
          password:(NSString*)password
         succeeded:(SessionCompletionBlock)successCallback
            failed:(SessionFailureBlock)failureCallback
{
    NSLog(@"Performing login %@", email);
    NSDictionary *params  = @{@"session":@{@"email": email, @"password": password}};
    NSString *APIEndpoint = @"http://api.ahorraralrepostar.com/sessions.json";
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    NSMutableURLRequest *request = [serializer requestWithMethod:@"POST" URLString:APIEndpoint parameters:params];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        successCallback((NSDictionary*)responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (HTTP_FORBIDEN == [operation.response statusCode]) {
            NSLog(@"Wrong credentials. Consider registering.");
            failureCallback(error);
        } else {
            NSLog(@"error: %@", error);
        }
    }];
    
    [[NSOperationQueue mainQueue] addOperation:op];
    
    return nil;
}
@end
