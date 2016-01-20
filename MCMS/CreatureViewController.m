//
//  CreatureViewController.m
//  MCMS
//
//  Created by Julian Lee on 1/19/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *creatureEditNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *creatureDetailTextField;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureEditNameTextField.hidden = TRUE;
    self.creatureNameLabel.text = self.creature.name;
    self.creatureDetailTextField.hidden = TRUE;
    self.creatureDetailLabel.text = self.creature.detail;
    self.creatureImage.image = self.creature.image;
    
}


- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if ([self.editButton.title isEqualToString: @"Done"]) {
        self.editButton.title = @"Edit";
        
        self.creatureEditNameTextField.hidden = TRUE;
        self.creature.name = self.creatureEditNameTextField.text;
        self.creatureNameLabel.text = self.creature.name;
        
        self.creatureDetailTextField.hidden = TRUE;
        self.creature.detail = self.creatureDetailTextField.text;
        self.creatureDetailLabel.text = self.creature.detail;
        
        self.title = self.creature.name;
    }else{
        self.editButton.title = @"Done";
        
        self.creatureEditNameTextField.hidden = FALSE;
        self.creatureEditNameTextField.text = self.creature.name;
        
        self.creatureDetailTextField.hidden = FALSE;
        self.creatureDetailTextField.text = self.creature.detail;
    }
    
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
