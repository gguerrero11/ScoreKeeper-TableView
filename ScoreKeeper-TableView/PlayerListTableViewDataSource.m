//
//  PlayerListTableViewDataSource.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PlayerListTableViewDataSource.h"
#import "PlayerTableViewCell.h"
#import "GameController.h"


@interface PlayerListTableViewDataSource ()

@property (nonatomic,strong) Game *game;

@end

@implementation PlayerListTableViewDataSource

NSString *cellIdentifier = @"cell";

// Required Protocols
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.game = [GameController sharedInstance].currentGame;
    return (unsigned long)self.game.arrayOfPlayers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.playerAtCell = self.game.arrayOfPlayers[indexPath.row];
    cell.nameTextField.text = cell.playerAtCell.name;
    cell.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)cell.playerAtCell.stepperValue];
    cell.cellStepper.value = cell.playerAtCell.stepperValue;
    
    
    return cell;
}


@end
