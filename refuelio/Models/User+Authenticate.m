//
//  User+Authenticate.m
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "User+Authenticate.h"
#import "SessionService.h"

@implementation User (Authenticate)
+ (User*) authenticateWithEmail:(NSString*) email
                    AndPassword:(NSString*) password
         inManagedObjectContext:(NSManagedObjectContext*) context
                      succeeded:(LoginSuccededBlock)successCallback
                         failed:(LoginFailedBlock)failureCallback
{
    
    User *user = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    request.predicate = [NSPredicate predicateWithFormat:@"email = %@", email];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ![matches count]) {
        [self authenticateFromAPI: email
                         password: password
           inManagedObjectContext: context
                        succeeded:^(User *authenticatedUser) { successCallback(authenticatedUser); }
                           failed:^(NSError *error) { failureCallback(error); }
         ];
    } else if ([matches count] > 0) {
        user = [matches firstObject];
        successCallback(user);
    } else if (error) {
        NSLog(@"Handle error on login!1");
    }
    
    return user;
}

+ (User*) buildUserFromSession:(NSDictionary*)session
        inManagedObjectContext:(NSManagedObjectContext*) context
{
    User *user     = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.email     = session[@"email"];
    user.authToken = session[@"auth_token"];
    return user;
}

+ (void) authenticateFromAPI:(NSString*)email
                     password:(NSString*)password
       inManagedObjectContext:(NSManagedObjectContext*) context
                    succeeded:(LoginSuccededBlock)successCallback
                       failed:(LoginFailedBlock)failureCallback
{
    [SessionService authenticateUser: email
                                    password: password
             succeeded:^(NSDictionary *response) {
                 NSLog(@"User+Auth: Response: %@", response);
                 User *authenticatedUser = [self buildUserFromSession:response
                                            inManagedObjectContext:context];
                 successCallback(authenticatedUser);
             } failed:^(NSError *error) {
                 NSLog(@"User+Auth: Error: %@", error);
                 failureCallback(error);
             }];
}
@end
