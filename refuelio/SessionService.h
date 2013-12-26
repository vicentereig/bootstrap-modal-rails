//
//  SessionClient.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SessionService : NSObject
+ authenticateUser:(NSString*)email password:(NSString*)password;
@end
