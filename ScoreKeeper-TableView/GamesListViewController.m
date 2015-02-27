//
//  GamesListViewController.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GamesListViewController.h"
#import "GamesListTableViewDataSource.h"
#import "PlayersListViewController.h"
#import "GameController.h"
#import "Game.h"

@interface GamesListViewController () <UITableViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic) UITableView *gamesListTableView;
@property (nonatomic, strong) GamesListTableViewDataSource *dataSource;

@end

@implementation GamesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Games List"; // title comes first
    //    float addPlayerViewHeight = 70;
    
    //Creating games list table
    self.gamesListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    // creating a dataSource for GameListTableViewDataSource and assigning it to class's datasource
    self.dataSource = [GamesListTableViewDataSource new];
    self.gamesListTableView.delegate = self;
    self.gamesListTableView.dataSource = self.dataSource;
    
    
    [self.view addSubview:self.gamesListTableView];
    //    [self.dataSource registerTableView:self.gamesListTableView];
    
    // Create "+" add button to create new project.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void) add:(id)sender {
    UIAlertView *nameAlert = [[UIAlertView alloc]initWithTitle:@"Enter Game Name" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    nameAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [nameAlert textFieldAtIndex:0].delegate = self;
    [nameAlert show];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *nameOfGame;
    if (![textField.text isEqual: @""]){
        nameOfGame = textField.text;
    } else {
        nameOfGame = @"Unnamed Game";
    }
    [[GameController sharedInstance] addGameWithName:nameOfGame];
    [self.gamesListTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayersListViewController *playerListViewController = [PlayersListViewController new];
    Game *gameSelected = [GameController sharedInstance].gamesArray[indexPath.row];
    [GameController sharedInstance].currentGame = gameSelected;
    [playerListViewController updateCurrentGame:gameSelected];
    [self.navigationController pushViewController:playerListViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
