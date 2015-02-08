//
//  PlayerTableViewCell.m
//  ScoreKeeper-TableView
//
//  Created by Gabriel Guerrero on 2/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PlayerTableViewCell.h"

@implementation PlayerTableViewCell 




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITextField *nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(24, 3, 128, 64)];
        nameTextField.placeholder = @"Insert Name";
        nameTextField.delegate = self;
        [self.contentView addSubview:nameTextField];
        
        UILabel *scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(155, 10, 50, 50)];
        scoreLabel.text = @"0";
        [self.contentView addSubview:scoreLabel];
        self.scoreLabel = scoreLabel;
        
        
        UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(200, 20, 0, 0)];
        self.defaultStepperColor = stepper.tintColor;
        NSLog(@"%@", stepper.tintColor);
        stepper.minimumValue = 0;
        stepper.maximumValue = 1000;
        [stepper addTarget:self action:@selector(scoreStepperPressed:) forControlEvents:UIControlEventTouchDown];
        [stepper addTarget:self action:@selector(scoreStepperChanged:) forControlEvents:UIControlEventValueChanged];
        [stepper addTarget:self action:@selector(scoreStepperUnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:stepper];
        
    }
    return self;
}



- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)scoreStepperPressed:(id)sender {
    UIStepper *stepper = sender;
    self.backgroundColor = [UIColor greenColor];
    stepper.tintColor = [UIColor greenColor];
}

- (void)scoreStepperUnPressed:(id)sender {
    UIStepper *stepper = sender;
    self.backgroundColor = [UIColor clearColor];
    stepper.tintColor = self.defaultStepperColor;
}

- (void)scoreStepperChanged:(id)sender {
    UIStepper *stepper = sender;
    int value = stepper.value;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", value];
    // NSLog(@"%d", stepper.value);
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder]; // What does this actually do?
    return TRUE;
}

@end
