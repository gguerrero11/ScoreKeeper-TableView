//
//  GameController.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GameController : NSObject

@property (nonatomic, strong) NSMutableArray *gamesArray;
@property (nonatomic, strong) Game *currentGame;



+ (GameController *)sharedInstance;

- (id)init;

- (void)addGame:(Game *)game;
- (void)removeGame:(Game *)game;
- (NSInteger)amountOfPlayersInArray;

@end
