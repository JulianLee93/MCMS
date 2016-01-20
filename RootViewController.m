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
    
    MagicalCreature *lilPuff = [MagicalCreature new];
    lilPuff.name = @"LilPuff";
    lilPuff.image = [UIImage imageNamed:@"CrazyPuff"];
    lilPuff.detail = @"tiny ass puff";
    
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
    CreatureViewController *destination = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    destination.creature = self.creatures[indexPath.row];
    destination.title = [[self.creatures objectAtIndex:indexPath.row] name];
}























@end
