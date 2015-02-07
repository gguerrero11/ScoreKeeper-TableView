//
//  ViewController.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "PlayerListTableViewDataSource.h"

@interface ViewController ()

@property (nonatomic, weak) UITableView *playersListTableView;
@property (nonatomic, strong) PlayerListTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *playersListTableView = [UITableView new];
    playersListTableView.frame = self.view.bounds;
    [self.view addSubview:playersListTableView];
    self.dataSource = [PlayerListTableViewDataSource new];
    playersListTableView.dataSource = self.dataSource;
    
    self.playersListTableView = playersListTableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
