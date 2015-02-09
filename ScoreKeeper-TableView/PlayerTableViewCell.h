//
//  PlayerTableViewCell.h
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) UILabel *scoreLabel;

@property (weak, nonatomic) UITextField *nameTextField;

@property (weak, nonatomic) UIStepper *cellStepper;

@property (nonatomic, strong) UIColor *defaultStepperColor;

@property (nonatomic, strong) NSDictionary *playerDataDictionary;


@end
