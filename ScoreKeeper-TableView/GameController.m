//
//  GameController.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (id) init {
    if (self) {
        self = [super init];
        self.gamesArray = [NSMutableArray new];
    }
    return self;
}

+ (GameController *) sharedInstance {
    static GameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [GameController new];
    });
    return sharedInstance;
}

- (void)addGame:(Game *)game {
    [self.gamesArray addObject:game];
}

- (void)removeGame:(Game *)game {
    [self.gamesArray removeObject:game];
}

- (NSInteger)amountOfPlayersInArray {
    
    return self.currentGame.arrayOfPlayers.count;
}


@end
