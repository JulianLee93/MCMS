//
//  RootViewController.m
//  MCMS
//
//  Created by Julian Lee on 1/19/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *creatures;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *monsterTextField;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *puff = [MagicalCreature new];
    puff.name = @"Puff";
    puff.image = [UIImage imageNamed:@"Puff"];
    puff.detail = @"origi-puff";
    puff.accessories = [[NSMutableArray alloc] initWithObjects:@"Water gun - 1 atk", @"Pipe - 4 atk", @"Spiked Mace - 32 atk", @"Bazooka - 152 atk", nil];
    
    MagicalCreature *lilPuff = [MagicalCreature new];
    lilPuff.name = @"CrazyPuff";
    lilPuff.image = [UIImage imageNamed:@"LilPuff"];
    lilPuff.detail = @"Crazy ass puff";
    
    MagicalCreature *bigPuff = [MagicalCreature new];
    bigPuff.name = @"BigPuff";
    bigPuff.image = [UIImage imageNamed:@"BigPuff"];
    bigPuff.detail = @"Big ass puff";
    
    MagicalCreature *megaPuff = [MagicalCreature new];
    megaPuff.name = @"MegaPuff";
    megaPuff.image = [UIImage imageNamed:@"MegaPuff"];
    megaPuff.detail = @"King of Puffs";
    
    
    self.creatures = [[NSMutableArray alloc] initWithObjects:puff, lilPuff, bigPuff, megaPuff, nil];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.creatures[indexPath.row] name];
    cell.detailTextLabel.text = [self.creatures[indexPath.row] detail];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


- (IBAction)onAddMonsterButtonTapped:(UIButton *)sender {
    MagicalCreature *currentCreature = [MagicalCreature new];
    currentCreature.name = self.monsterTextField.text;
    [self.creatures insertObject:currentCreature atIndex:0];
    [self.tableView reloadData];
    self.monsterTextField.text = @"";
    [self.view endEditing:TRUE];
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"BattleSegue"]) {
        BattleViewController *destination = segue.destinationViewController;
        destination.creature1 = self.creatures[arc4random_uniform((int)self.creatures.count)];
        destination.creature2 = self.creatures[arc4random_uniform((int)self.creatures.count)];
        while (destination.creature2 == destination.creature1) {
            destination.creature2 = self.creatures[arc4random_uniform((int)self.creatures.count)];
        }
        
    }
    else
    {
        CreatureViewController *destination = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destination.creature = self.creatures[indexPath.row];
        destination.title = [[self.creatures objectAtIndex:indexPath.row] name];
    }
    
}























@end
