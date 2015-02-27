//
//  Stack.m
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//


#import <Foundation/Foundation.h>
@import CoreData;

@interface Stack : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

+ (Stack *)sharedInstance;

- (void) save;

@end