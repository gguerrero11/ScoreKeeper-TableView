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
#import "Player.h"


@interface PlayerListTableViewDataSource ()

@property (nonatomic,strong) Game *game;
@property (nonatomic, strong) Player *player;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PlayerListTableViewDataSource

NSString *cellIdentifier = @"cell";

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    
}

// Required Protocols
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.game.players.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    PlayersListViewController *playersListViewController = [PlayersListViewController new];
    cell.playerAtCell = playersListViewController.arrayOfPlayers[indexPath.row];
    cell.nameTextField.text = cell.playerAtCell.name;
    cell.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)cell.playerAtCell.stepperValue];
    cell.cellStepper.value = [cell.playerAtCell.stepperValue integerValue];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[GameController sharedInstance]removePlayerFromGame:self.player];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
//        [self.tableView reloadData];
        
    }
    
    
}

@end
