//
//  CreatureViewController.m
//  MCMS
//
//  Created by Julian Lee on 1/19/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *creatureEditNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureEditNameTextField.hidden = TRUE;
    self.creatureNameLabel.text = self.creature.name;
    self.creatureDetailLabel.text = self.creature.detail;
    self.creatureImage.image = self.creature.image;
    self.creatureDetailLabel.editable = FALSE;
    
}


- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if ([self.editButton.title isEqualToString: @"Done"]) {
        self.editButton.title = @"Edit";
        
        self.creatureEditNameTextField.hidden = TRUE;
        self.creature.name = self.creatureEditNameTextField.text;
        self.creatureNameLabel.text = self.creature.name;
        
        self.creatureDetailLabel.editable = FALSE;
        self.creature.detail = self.creatureDetailLabel.text;
        self.creatureDetailLabel.text = self.creature.detail;
        
        self.creatureDetailLabel.layer.borderWidth = 0.0f;
        
        self.title = self.creature.name;
    }else{
        self.editButton.title = @"Done";
        
        self.creatureEditNameTextField.hidden = FALSE;
        self.creatureEditNameTextField.text = self.creature.name;

        self.creatureDetailLabel.editable = TRUE;
        self.creatureDetailLabel.text = self.creature.detail;
        
        self.creatureDetailLabel.layer.borderWidth = 0.7f;
        self.creatureDetailLabel.layer.borderColor = [[[UIColor grayColor] colorWithAlphaComponent:0.35] CGColor];
        self.creatureDetailLabel.layer.cornerRadius = 5.0f;

    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    cell.textLabel.text = self.creature.accessories[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creature.accessories.count;
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
