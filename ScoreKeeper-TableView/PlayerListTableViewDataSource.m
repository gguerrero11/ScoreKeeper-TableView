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

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) Player *player;


@end

@implementation PlayerListTableViewDataSource

NSString *cellIdentifier = @"cell";

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[PlayerTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

#pragma mark required protocols

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [GameController sharedInstance].currentGame.players.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.playerAtCell = [GameController sharedInstance].playersArray[indexPath.row];
    NSLog(@"INDEX %ld",(long)indexPath.row);
    cell.nameTextField.text = cell.playerAtCell.name;
    cell.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)[cell.playerAtCell.stepperValue integerValue]];
    cell.cellStepper.value = [cell.playerAtCell.stepperValue integerValue];
    return cell;
}

#pragma mark Deleting Cell method

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[GameController sharedInstance]removePlayerFromGame:self.player];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

@end
