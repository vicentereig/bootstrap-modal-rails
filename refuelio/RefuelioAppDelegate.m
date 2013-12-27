//
//  RefuelioAppDelegate.m
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "RefuelioAppDelegate.h"
#import <CoreData/CoreData.h>
#import <Crashlytics/Crashlytics.h>

@interface RefuelioAppDelegate()
@property (strong, nonatomic) UIManagedDocument *document;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

@implementation RefuelioAppDelegate
@synthesize document;

- (void) setupUIManagedDocument
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory  = [[fileManager URLsForDirectory:NSDocumentDirectory
                                                      inDomains:NSUserDomainMask] firstObject];
    
    NSString *documentName     = @"Refuelio";
    NSURL *url                 = [documentsDirectory URLByAppendingPathComponent:documentName];
    UIManagedDocument *doc     = [[UIManagedDocument alloc] initWithFileURL:url];
    self.document              = doc;

    if ([fileManager fileExistsAtPath:[url path]]) {
        [self.document openWithCompletionHandler:^(BOOL success) {
            if (success) [self documentIsReady];
            if (!success) NSLog(@"Could not open document at %@", url);
        }];
    } else {
        [self.document saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            if (success) [self documentIsReady];
            if (!success) NSLog(@"Could not create document at %@", url);
        }];
    }
}

- (void) documentIsReady
{
    if (self.document.documentState == UIDocumentStateNormal) {
        NSManagedObjectContext *managedObjectContext = self.document.managedObjectContext;
        NSLog(@"Got the MOC!");
        self.managedObjectContext = managedObjectContext;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Crashlytics startWithAPIKey:@"53e759f75db846b829ff35a614a509427aeac692"];
//    [self setupUIManagedDocument];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
