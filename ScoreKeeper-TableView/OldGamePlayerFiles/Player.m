//
//  Player.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id) init {
    self = [super init];
    if (self) {
        self.name = @"";
        self.stepperValue = 0;
    }
    return self;
}
@end
