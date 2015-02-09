//
//  ViewController.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "PlayerListTableViewDataSource.h"

@interface ViewController () <UITableViewDelegate>

@property (nonatomic, weak) UITableView *playersListTableView;
@property (nonatomic, strong) PlayerListTableViewDataSource *dataSource;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Score Keeper"; // title comes first
    float addPlayerViewHeight = 70;
    
    // Creating the Table View of the list of players
    UITableView *playersListTableView = [UITableView new];
    CGRect playerTableViewFrame = self.view.bounds;
    playerTableViewFrame.size.height -= addPlayerViewHeight;
    playersListTableView.frame = playerTableViewFrame;
    playersListTableView.allowsSelection = NO;
    [self.view addSubview:playersListTableView];
    // creating a dataSource for PlayerListTableViewDataSource and assigning it to class's datasource
    self.dataSource = [PlayerListTableViewDataSource new];
    playersListTableView.dataSource = self.dataSource;
    playersListTableView.delegate = self;

    
    // UIView container for the Add Players section, which will contain the name, score, stepper items
    UIView *addPlayerView = [[UIView alloc]initWithFrame:CGRectMake(0, playerTableViewFrame.size.height, self.view.frame.size.width , addPlayerViewHeight)];
    [self.view addSubview:addPlayerView];
    addPlayerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *addPlayerLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 200, addPlayerViewHeight)];
    [addPlayerView addSubview:addPlayerLabel];
    addPlayerLabel.text = @"Add Player?";
    UIStepper *addPlayerStepper = [[UIStepper alloc] initWithFrame:CGRectMake(200, 20, 0, 0)];
    [addPlayerView addSubview:addPlayerStepper];
    addPlayerStepper.tintColor = [UIColor blackColor];
    addPlayerStepper.minimumValue = self.dataSource.playersDictionaryArray.count;
    addPlayerStepper.maximumValue = 20;
    [addPlayerStepper addTarget:self action:@selector(numberOfPlayers:) forControlEvents:UIControlEventTouchDown];
    // assigns the playersListTableView we just created to the @property of the playersListTableView class
    self.playersListTableView = playersListTableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// this always has to be in the same class as where UITableViewDelegate is or the "<UITableViewDelegate>" code
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)numberOfPlayers:(id)sender {
    UIStepper *stepper = sender;
    
    double value = stepper.value;
    NSMutableDictionary *playerDataDictionary = [@{@"name": @"", @"score": @"0", @"stepperValue": @0} mutableCopy];
    if (value > self.dataSource.playersDictionaryArray.count){
        [self.dataSource.playersDictionaryArray addObject:playerDataDictionary];
    } else if (self.dataSource.playersDictionaryArray.count > 1) {
        [self.dataSource.playersDictionaryArray removeLastObject];
        }
    [self.playersListTableView reloadData];
    
    NSLog(@"---%f", value);
    
}

@end
