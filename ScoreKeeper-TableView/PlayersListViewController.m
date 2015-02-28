//
//  ViewController.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PlayersListViewController.h"
#import "PlayerListTableViewDataSource.h"
#import "GameController.h"
#import "Player.h"

@interface PlayersListViewController () <UITableViewDelegate>

@property (nonatomic, strong) PlayerListTableViewDataSource *dataSource;
@property (nonatomic, strong) Game *currentGame;
@property (nonatomic) UITableView *playersListTableView;
@property (nonatomic) UIView *addPlayerView;


@end

@implementation PlayersListViewController


- (void)updateCurrentGame:(Game *)gamePassedIn {
    self.currentGame = gamePassedIn;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.currentGame.gameName;  // title comes first
    float addPlayerViewHeight = 70;
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"Array of Players %lu", (unsigned long)self.dataSource);
    
    [self.playersListTableView reloadData];
    
    // Creating the Table View of the list of players
    self.playersListTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    CGRect playerTableViewFrame = self.view.bounds;
    playerTableViewFrame.size.height -= addPlayerViewHeight;
    self.playersListTableView.frame = playerTableViewFrame;
    self.playersListTableView.allowsSelection = NO;
    [self.view addSubview:self.playersListTableView];
    
    // UIView container for the Add Players section, which will contain the name, score, stepper items
    self.addPlayerView = [[UIView alloc]initWithFrame:CGRectMake(0, playerTableViewFrame.size.height, self.view.frame.size.width , addPlayerViewHeight)];
    [self.view addSubview:self.addPlayerView];
    UIButton *addPlayerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.addPlayerView addSubview:addPlayerButton];
    addPlayerButton.frame = CGRectMake(5, 6, 310, 60);
    addPlayerButton.layer.cornerRadius = 20;
    addPlayerButton.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    [addPlayerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addPlayerButton setTitle:@"Add Player" forState:UIControlStateNormal];
    [addPlayerButton addTarget:self action:@selector(addPlayerPressed) forControlEvents:UIControlEventTouchDown];
    [addPlayerButton setBackgroundColor:[UIColor colorWithRed:100/255 green:120/255 blue:255/255 alpha:1.0]];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTableView)];
    self.navigationItem.rightBarButtonItem = editButton;
    self.playersListTableView.allowsSelection = NO;
    
    // creating a dataSource for PlayerListTableViewDataSource and assigning it to class's datasource
    self.dataSource = [PlayerListTableViewDataSource new];
    self.playersListTableView.dataSource = self.dataSource;
    self.playersListTableView.delegate = self;
    [self.dataSource registerTableView:self.playersListTableView];
}

-(void)editTableView {
    [self.playersListTableView setEditing:YES animated:YES];
}

// this always has to be in the same class as where UITableViewDelegate is or the "<UITableViewDelegate>" code
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void) buttonAnimation {
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(.85, .85);
    [UIView animateWithDuration:0.05 animations:^{
        self.addPlayerView.transform = scaleTransform;
    } completion:^(BOOL finished) {
        CGAffineTransform scaleNormalTransform = CGAffineTransformMakeScale(1, 1);
        [UIView animateWithDuration:0.2 animations:^{
            self.addPlayerView.transform = scaleNormalTransform;
        } completion:nil];
    } ];
}


#pragma mark Add Player Button

- (void)addPlayerPressed {
    [self buttonAnimation];
    
    // So this is only adding +1 to the count of the Array for the dataSource, this is NOT actually adding a player to Core Data.
    // It's until the user inputs a name that it will save.
    //NSMutableArray *tempArray = [self.arrayOfPlayers mutableCopy];
    //[tempArray addObject:[Player new]];
    //self.dataSource.arrayForCount = tempArray;
    //self.arrayOfPlayers = tempArray;
    //NSLog(@"self.arrayOfPlayers PlayersListViewController: %lu",(unsigned long)self.dataSource.arrayForCount.count);
    
    
    [[GameController sharedInstance] addPlayerWithName];
    [self.playersListTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
