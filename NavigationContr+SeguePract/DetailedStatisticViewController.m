//
//  DetailedStatisticViewController.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 13.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "DetailedStatisticViewController.h"

#import "CustomCellForCartList.h"

static NSString* const kCellReuseID=@"detailed-statistics-cell-reuse-id";

@interface DetailedStatisticViewController ()
{
    NSMutableArray<NSArray<CartItem*>*>* _clonedSessionArray;
}
@end

@implementation DetailedStatisticViewController

@synthesize clonedSessionArray=_clonedSessionArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.clonedSessionArray[self.index].count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
         cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CustomCellForCartList *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellReuseID
                                                                  forIndexPath:indexPath];
    
    if(cell)
    {
        [cell setCellData:self.clonedSessionArray[self.index][indexPath.row]];
    }
    
    return cell;
}

#pragma mark - My Methods

-(void)customMethodSetClonedSessionArray:(NSArray<NSArray<CartItem*>*>*)clonedArray
{
    self->_clonedSessionArray=[NSMutableArray new];
    [self->_clonedSessionArray setArray:clonedArray];
}

@end
