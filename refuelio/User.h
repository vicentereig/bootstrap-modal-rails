//
//  User.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/26/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Refueling;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * authToken;
@property (nonatomic, retain) NSSet *refuelings;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addRefuelingsObject:(Refueling *)value;
- (void)removeRefuelingsObject:(Refueling *)value;
- (void)addRefuelings:(NSSet *)values;
- (void)removeRefuelings:(NSSet *)values;

@end
