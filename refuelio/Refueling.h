//
//  Refueling.h
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/26/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Fuel, User;

@interface Refueling : NSManagedObject

@property (nonatomic, retain) NSNumber * amountSaved;
@property (nonatomic, retain) NSNumber * amountSpent;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) Fuel *fuel;
@property (nonatomic, retain) User *user;

@end
