//
//  GamesListTableViewDataSource.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GamesListTableViewDataSource.h"
#import "GameController.h"

NSString *gameCellIndentifier = @"gameCell";

@interface GamesListTableViewDataSource ()
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation GamesListTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:gameCellIndentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [GameController sharedInstance].gamesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:gameCellIndentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:gameCellIndentifier];
    }
   
    
    Game *game = [GameController sharedInstance].gamesArray[indexPath.row];
    cell.textLabel.text = game.gameName;
    return cell;
}

#pragma mark Deleting Cell method

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    self.currentGame = [GameController sharedInstance].playersArray[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
//        [tableView beginUpdates];
//        [[GameController sharedInstance]removeGame:self.currentGame];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
//        [tableView endUpdates];
    }
}



@end
