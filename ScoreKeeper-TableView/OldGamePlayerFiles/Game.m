//
//  Game.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id) init {
    if (self) {
    self = [super init];
       self.arrayOfPlayers = [NSMutableArray new];
    }
    return self;
}

- (void)addPlayer:(Player *)player {
    [self.arrayOfPlayers addObject:player];
}

- (void)removePlayer:(Player *)player {
    [self.arrayOfPlayers removeObject:player];
}

@end
