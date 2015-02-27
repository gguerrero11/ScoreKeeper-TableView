//
//  Game.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
@interface Game : NSObject


@property (nonatomic,strong) NSMutableArray *arrayOfPlayers;
@property (nonatomic,strong) NSString * gameName;

-(id)init;

- (void)addPlayer:(Player *)player;
- (void)removePlayer:(Player *)player;


@end
