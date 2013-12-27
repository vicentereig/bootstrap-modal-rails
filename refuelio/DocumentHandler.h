//
//  DocumentHandler.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/26/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^OnDocumentReady) (UIManagedDocument *document);

@interface DocumentHandler : NSObject
@property (strong, nonatomic) UIManagedDocument *document;
+ (DocumentHandler*) sharedDocumentHandler;
- (void)perform:(OnDocumentReady)onDocumentReady;
@end
