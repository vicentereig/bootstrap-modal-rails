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
{
    User *user = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    request.predicate = [NSPredicate predicateWithFormat:@"email = %@", email];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ![matches count]) {
        [self authenticateFromAPI: email
                         password: password];
    } else if ([matches count] > 0) {
        user = [matches firstObject];
    } else  if (error) {
        NSLog(@"Handle error on login!1");
    }
    
    return user;
}

+ (User*) authenticateFromAPI:(NSString*)email password:(NSString*)password
{
    NSString *authToken = nil;
    authToken = [SessionService authenticateUser: email
                                       password: password
                 succeeded:^(NSDictionary *response) {
                     // store it into the KeyChain
                     // create user
                     // call callback to Segue to SavingsReportsView
                     NSLog(@"SessionService: Response: %@", response);
                 } failed:^(NSError *error) {
                     NSLog(@"SessionService: Error: %@", error);
                 }];
    return nil;
}
@end
