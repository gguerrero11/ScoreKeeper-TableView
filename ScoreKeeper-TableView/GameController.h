//
//  GameController.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Stack.h"
#import "Player.h"

@interface GameController : NSObject

@property (nonatomic, strong) NSArray *gamesArray;
@property (nonatomic, strong) Game *currentGame;



+ (GameController *)sharedInstance;

- (id)init;

- (Game *)addGameWithName:(NSString *)name;

- (void)removeGame:(Game *)game;

- (void)addPlayerToGame;

- (void)removePlayerFromGame:(Player *)player;

//- (void)addPlayerToGameWithName:(NSString *)namePassedIn
//                   StepperValue:(NSNumber *)stepperValuePassedIn;
// - (void)updatePlayerData:(Player *)passedInPlayer;



@end
