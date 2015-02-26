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



@implementation PlayerListTableViewDataSource 



NSString *cellIdentifier = @"cell";

//// Overriding the init method for PlayerListTableView's initializer (subclassed from UITableView)
//- (id)init {
//    self = [super init]; // self its own initializer (PlayerListTableView) overriding the superclass's (UITableView) initalizer.
//    if (self) {
//        self.playersDictionaryArray = [NSMutableArray new];
//        NSMutableDictionary *playerDataDictionary = [@{@"name": @"", @"score": @"0", @"stepperValue": @0} mutableCopy];
//        [self.playersDictionaryArray addObject:playerDataDictionary];
//        
//    }
//    return self;
//}



// Required Protocols
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Game *game = [GameController sharedInstance].currentGame;
    return (unsigned long)game.arrayOfPlayers.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    Player *player = [Player new];
    player = [GameController sharedInstance].gamesArray[indexPath.row];

    cell.nameTextField.text = player.name;
    
//    cell.scoreLabel.text = [NSString stringWithFormat:(@"%lu", (long)player.stepperValue)];
    cell.cellStepper.value = player.stepperValue;
    cell.playerAtCell = player;

    return cell;
}







@end
