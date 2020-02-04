//
//  StatisticTableTableViewController.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 13.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "StatisticTableTableViewController.h"
#import "DataPriceSaveArray.h"
#import "CustomCellForStatistics.h"
#import "DetailedStatisticViewController.h"

static NSString* const cellReuseID=@"cell-reuse-id";

static NSString* const kSegueReuseID=@"show-session-id";

@interface StatisticTableTableViewController () <UINavigationControllerDelegate>

@property(nonatomic, strong)DataPriceSaveArray* dataArray;

@property(nonatomic)NSUInteger indexPathRow;

@property(nonatomic, strong)NSArray<UITableViewRowAction*>* rowActions;

@end

@implementation StatisticTableTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableViewRowAction* deleteAction=
    [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                       title:@"❌"
                                     handler:^(UITableViewRowAction* action, NSIndexPath* indexPath)
                                            {
                                                [self.dataArray removeSaveItemAtIndex:indexPath.row];
                                                                            
                                                [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                                                                      withRowAnimation:UITableViewRowAnimationLeft];
                                            }];
    
    self.rowActions=@[deleteAction];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
    self.dataArray=[[DataPriceSaveArray alloc]init];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.dataPriceObjectsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCellForStatistics* cell = [self.tableView dequeueReusableCellWithIdentifier:cellReuseID
                                                                         forIndexPath:indexPath];
    
    if(cell)
    {
        [cell setDataIntoCell:self.dataArray.dataPriceObjectsArray[indexPath.row]
                 andIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - Navigation

-(void)         tableView:(UITableView*)tableView
  didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath
                                  animated:YES];
    self.indexPathRow=indexPath.row;
    
    //NSString* titleText=[NSString stringWithFormat:@"Статистика за %@", self.dataArray.dataPriceObjectsArray[indexPath.row].date];
    
    [self performSegueWithIdentifier:kSegueReuseID
                              sender:nil];
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView*)tableView
               editActionsForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return self.rowActions;
}

-(void)prepareForSegue:(UIStoryboardSegue*)segue
                sender:(id)sender
{
    [super prepareForSegue:segue
                    sender:sender];

    if([segue.identifier isEqualToString:kSegueReuseID])
    {
        DetailedStatisticViewController* detailedStatisticsController=segue.destinationViewController;
        
        [detailedStatisticsController customMethodSetClonedSessionArray:[self.dataArray returnSessionArray]];

        detailedStatisticsController.index=self.indexPathRow;
        
        //NSString* titleText=sender;
        
        //detailedStatisticsController.navigationItem.title=titleText;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
