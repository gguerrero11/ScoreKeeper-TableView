//
//  GameController.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GameController.h"


@implementation GameController

-(id) init {
    if (self) {
        self = [super init];
        self.gamesArray = [NSMutableArray new];
        
    }
    return self;
}

#pragma mark Controller for Game

+ (GameController *) sharedInstance {
    static GameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [GameController new];
    });
    return sharedInstance;
}

-(NSArray *)gamesArray {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    NSArray *objects =  [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    return objects;
}

-(Game *)addGameWithName:(NSString *)name{
    self.currentGame = [NSEntityDescription insertNewObjectForEntityForName:@"Game"
                                               inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    self.currentGame.gameName = name;
    [self save];
    return self.currentGame;
}

-(void)removeGame:(Game *)game {
    if (!game) {
        return;
    }
//    NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:[GameController sharedInstance].gamesArray];
//    [mutableArray removeObject:game];
//    [GameController sharedInstance].gamesArray = mutableArray;
    
    [game.managedObjectContext deleteObject:game];
    [self save];

}

#pragma mark Controller for Player

-(NSArray *)playersArray {
    
    // NOTE: Unecessary Fetch request because its been already fetched when "Game" was fetched.
    //NSFetchRequest *playerFetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"player"];
    //NSArray *playerObjects =  [self.currentGame.players];
    return [self.currentGame.players array];
}

- (Player *)addPlayerWithName{

    Player *newPlayer = [NSEntityDescription insertNewObjectForEntityForName:@"Player"
                                                      inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    // Initial score
    newPlayer.stepperValue = 0;
    
    // Converts NSSet players into Mutable Array to add a new player, then converts back to NSOrderedSet
    NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:[self.currentGame.players array]];
    [mutableArray addObject:newPlayer];
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:mutableArray];
    self.currentGame.players = orderedSet;
    [self save];
    return newPlayer;
}

-(void)removePlayerFromGame:(Player *)player {
    if (!player) {
        return;
    }
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:[self.currentGame.players array]];
    [mutableArray removeObject:player];
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:mutableArray];
    self.currentGame.players = orderedSet;
    [self save];

    
}

#pragma mark Saving method

-(void)save {

    [[Stack sharedInstance] save];
    
}


@end
