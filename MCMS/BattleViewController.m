//
//  BattleViewController.m
//  MCMS
//
//  Created by Julian Lee on 1/19/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage1;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage2;
@property (weak, nonatomic) IBOutlet UILabel *creatureLabel1;
@property (weak, nonatomic) IBOutlet UILabel *creatureLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *winnerImage;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.creatureImage1 setImage:self.creature1.image];
    [self.creatureImage2 setImage:self.creature2.image];
    [self.creatureLabel1 setText:self.creature1.name];
    [self.creatureLabel2 setText:self.creature2.name];

    if (arc4random_uniform(2) == 1) {
        [self.winnerImage setImage:self.creature1.image];
        [self.winnerLabel setText:self.creature1.name];
    }
    else
    {
        [self.winnerImage setImage:self.creature2.image];
        [self.winnerLabel setText:self.creature2.name];
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
