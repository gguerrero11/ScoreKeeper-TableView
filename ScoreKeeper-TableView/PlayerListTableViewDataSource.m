//
//  PlayerListTableViewDataSource.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PlayerListTableViewDataSource.h"
#import "PlayerTableViewCell.h"

@implementation PlayerListTableViewDataSource 

// Overriding the init method for PlayerListTableView's initializer (subclassed from UITableView)
- (id)init {
    self = [super init]; // self its own initializer (PlayerListTableView) overriding the superclass's (UITableView) initalizer.
    if (self) {
        self.numOfPlayers = 1;  // that way, we can access its numOfPlayers property (to be later returned in the tableView's initialzer protocol
    }
    return self;
}

// Required Protocols
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numOfPlayers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {

        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}







@end
