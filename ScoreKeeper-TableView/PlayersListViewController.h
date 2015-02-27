//
//  ViewController.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface PlayersListViewController : UIViewController

@property (nonatomic,strong) NSArray *arrayOfPlayers;

-(void)updateCurrentGame:(Game *)gamePassedIn;

@end

