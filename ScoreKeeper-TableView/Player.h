//
//  Player.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/26/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * stepperValue;
@property (nonatomic, retain) Game *game;

@end
