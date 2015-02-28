//
//  PlayerListTableViewDataSource.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PlayersListViewController.h"


@interface PlayerListTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) PlayersListViewController *playerListViewController;

@property (nonatomic, strong) Player *player;

-(void)registerTableView:(UITableView *)tableView;





@end
