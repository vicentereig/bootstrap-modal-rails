//
//  User+Authenticate.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "User.h"

@interface User (Authenticate)

typedef void (^LoginSuccededBlock)(User *authenticatedUser);
typedef void (^LoginFailedBlock)(NSError *error);

+ (User*) authenticateWithEmail:(NSString*) email
                    AndPassword:(NSString*) password
         inManagedObjectContext:(NSManagedObjectContext*) context
                      succeeded:(LoginSuccededBlock)successCallback
                         failed:(LoginFailedBlock)failureCallback;

@end
