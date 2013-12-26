//
//  User+Authenticate.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "User.h"

@interface User (Authenticate)
+ (User*) authenticateWithEmail:(NSString*) email
                    AndPassword:(NSString*) password
         inManagedObjectContext:(NSManagedObjectContext*) context;

@end
