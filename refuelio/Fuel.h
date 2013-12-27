//
//  Fuel.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/26/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Refueling;

@interface Fuel : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *refuelings;
@end

@interface Fuel (CoreDataGeneratedAccessors)

- (void)addRefuelingsObject:(Refueling *)value;
- (void)removeRefuelingsObject:(Refueling *)value;
- (void)addRefuelings:(NSSet *)values;
- (void)removeRefuelings:(NSSet *)values;

@end
