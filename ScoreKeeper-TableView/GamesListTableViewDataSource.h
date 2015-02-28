//
//  GamesListTableViewDataSource.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Game.h"

@interface GamesListTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Game *currentGame;

- (void)registerTableView:(UITableView *)tableView;

@end
