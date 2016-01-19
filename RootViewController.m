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
    
    MagicalCreature *yeti = [MagicalCreature new];
    yeti.name = @"Yeti";
    
    MagicalCreature *nessi = [MagicalCreature new];
    nessi.name = @"Nessi";
    
    self.creatures = [NSMutableArray arrayWithObjects:puff, yeti, nessi, nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.creatures[indexPath.row] name];
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
