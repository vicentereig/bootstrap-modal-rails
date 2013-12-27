//
//  DocumentHandler.m
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/26/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "DocumentHandler.h"

@interface DocumentHandler()
- (void) objectsDidChange:(NSNotification*) notification;
- (void) contextDidSave:(NSNotification*) notification;
@end

@implementation DocumentHandler
@synthesize document = _document;

static DocumentHandler *_sharedInstance;
+ (DocumentHandler*) sharedDocumentHandler
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc]init];
    });
    
    return _sharedInstance;
}

- (id) init
{
    self = [super init];
    if (self) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURL *documentsDirectory  = [[fileManager URLsForDirectory:NSDocumentDirectory
                                                          inDomains:NSUserDomainMask] firstObject];
        
        NSString *documentName     = @"RefuelioDb.md";
        NSURL *url                 = [documentsDirectory URLByAppendingPathComponent:documentName];
        UIManagedDocument *doc     = [[UIManagedDocument alloc] initWithFileURL:url];
        self.document              = doc;

        
        // Register for notifications
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(objectsDidChange:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:self.document.managedObjectContext];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(contextDidSave:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:self.document.managedObjectContext];
    }
    return self;

}

- (void) perform:(OnDocumentReady)onDocumentReady
{
     NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[self.document.fileURL path]]) {
        [self.document openWithCompletionHandler:^(BOOL success) {
            if (success) onDocumentReady(self.document);
            if (!success) NSLog(@"Could not open document at %@", self.document.fileURL);
        }];
    } else {
        [self.document saveToURL:self.document.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            if (success) onDocumentReady(self.document);
            if (!success) NSLog(@"Could not create document at %@", self.document.fileURL);
        }];
    }

}

- (void)objectsDidChange:(NSNotification *)notification
{
#ifdef DEBUG
    NSLog(@"NSManagedObjects did change.");
#endif
}

- (void)contextDidSave:(NSNotification *)notification
{
#ifdef DEBUG
    NSLog(@"NSManagedContext did save.");
#endif
}
@end
