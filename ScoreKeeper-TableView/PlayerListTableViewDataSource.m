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

NSString *cellIdentifier = @"cell";

// Overriding the init method for PlayerListTableView's initializer (subclassed from UITableView)
- (id)init {
    self = [super init]; // self its own initializer (PlayerListTableView) overriding the superclass's (UITableView) initalizer.
    if (self) {
        self.playersDictionaryArray = [NSMutableArray new];
        NSMutableDictionary *playerDataDictionary = [@{@"name": @"", @"score": @"0", @"stepperValue": @0} mutableCopy];
        [self.playersDictionaryArray addObject:playerDataDictionary];
        
    }
    return self;
}

// Required Protocols
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playersDictionaryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSMutableDictionary *playerDataDictionary = [self.playersDictionaryArray objectAtIndex:indexPath.row];
    cell.nameTextField.text = [playerDataDictionary objectForKey:@"name"];
    cell.scoreLabel.text = [playerDataDictionary objectForKey:@"score"];
    cell.cellStepper.value = [[playerDataDictionary objectForKey:@"stepperValue"] intValue];
    cell.playerDataDictionary = playerDataDictionary;

    return cell;
}







@end
