//
//  SessionClient.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface SessionService : NSObject
typedef void (^SessionCompletionBlock)(NSDictionary *response);
typedef void (^SessionFailureBlock)(NSError *error);

+ authenticateUser:(NSString*)email
          password:(NSString*)password
           succeeded:(SessionCompletionBlock)successCallback
            failed:(SessionFailureBlock)failureCallback;

+ authenticateUserFromKeyChain;

@end
