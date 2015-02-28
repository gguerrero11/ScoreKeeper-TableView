//
//  PlayerTableViewCell.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PlayerTableViewCell.h"
#import "Player.h"
#import "GameController.h"

@implementation PlayerTableViewCell





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITextField *nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(24, 3, 128, 64)];
        nameTextField.placeholder = @"Insert Name";
        nameTextField.delegate = self;
        [self.contentView addSubview:nameTextField];
        self.nameTextField = nameTextField;
        
        UILabel *scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(155, 10, 50, 50)];
        [self.contentView addSubview:scoreLabel];
        self.scoreLabel = scoreLabel;
        
        UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(200, 20, 0, 0)];
        self.defaultStepperColor = stepper.tintColor;
        stepper.minimumValue = 0;
        stepper.maximumValue = 1000;
        [stepper addTarget:self action:@selector(scoreStepperChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:stepper];
        self.cellStepper = stepper;
    }
    return self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.playerAtCell.name = textField.text;
        [[GameController sharedInstance] save];
}

- (void)scoreStepperChanged:(id)sender {
    UIStepper *stepper = sender;
    NSNumber *stepperValue = [NSNumber numberWithInteger:stepper.value];
    self.scoreLabel.text = [NSString stringWithFormat:@"%@", stepperValue];
    self.playerAtCell.stepperValue = stepperValue;
    [[GameController sharedInstance] save];
}


- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return TRUE;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
