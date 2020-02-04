//
//  CompareListController.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 16.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "CompareListController.h"

static NSString* const compareCellReuseID=@"compare-list-cell-reuse-id";

@interface CompareListController ()

@property(nonatomic, strong)CompareList* compareListInstance;
@property(nonatomic, strong)NSArray<UITableViewRowAction*>* rowActions;

@end

@implementation CompareListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.compareListInstance=[[CompareList alloc] init];
    
    UITableViewRowAction* deleteAction=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                                          title:@"❌"
                                                                        handler:^(UITableViewRowAction* action, NSIndexPath* indexPath)
    {
        [self.compareListInstance deleteCompareItemAtIndex:indexPath.section
                                                    andRow:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationLeft];
        
        [self.tableView reloadData];
    }];
    
    self.rowActions=@[deleteAction];
//    UINib* headerNib=[UINib nibWithNibName:[CustomHeaderForCompareList nibName]
//                                    bundle:[NSBundle mainBundle]];
//    
//    [self.tableView     registerNib:headerNib
// forHeaderFooterViewReuseIdentifier:[CustomHeaderForCompareList headerReuseID]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)addButtonTap:(id)sender
{
    UIAlertController* addProductMessage=
    [UIAlertController alertControllerWithTitle:@"Добавление продукта"
                                        message:@"Введите данные о продукте"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [addProductMessage addTextFieldWithConfigurationHandler:^(UITextField* textField)
     {
        textField.placeholder=@"название";
     }];
    
    [addProductMessage addTextFieldWithConfigurationHandler:^(UITextField* textField)
     {
         textField.placeholder=@"цена";
     }];
    
    [addProductMessage addTextFieldWithConfigurationHandler:^(UITextField* textField)
     {
         textField.placeholder=@"магазин";
     }];
    
    UIAlertAction* okAction=
    [UIAlertAction actionWithTitle:@"Добавить"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction* action)
                           {
                               CompareItem* item=[[CompareItem alloc] init];
                               
                               NSString* name=[[addProductMessage textFields][0]text];
                               name=[name lowercaseString];
                               name=[name capitalizedString];
                               
                               item.name=name;
                               
                               [item setPriceFromStringValue:[[addProductMessage textFields][1]text]];
                               
                               NSString* shopName=[[addProductMessage textFields][2]text];
                               shopName=[shopName lowercaseString];
                               shopName=[shopName capitalizedString];
                               
                               item.shopName=shopName;
                               
                               [self.compareListInstance addItem:item
                                                        withName:item.name];
                               
                               [self.compareListInstance saveData];
                               
                               [self.tableView reloadData];
                           }];
    
    UIAlertAction* cancelAction=
    [UIAlertAction actionWithTitle:@"Отменить"
                             style:UIAlertActionStyleCancel
                           handler:nil];
    
    [addProductMessage addAction:okAction];
    [addProductMessage addAction:cancelAction];
    
    [self presentViewController:addProductMessage
                       animated:YES
                     completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    if(self.compareListInstance.compareList.count==0)
    {
        return 1;
    }
    
    return self.compareListInstance.compareList.count;
}

-(NSString*)    tableView:(UITableView *)tableView
  titleForHeaderInSection:(NSInteger)section
{
    if(self.compareListInstance.compareList.count==0)
    {
        return @"В списке нет продуктов.";
    }
    
    return [self.compareListInstance.compareList[section] getItemName];
}

- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if(self.compareListInstance.compareList.count==0)
    {
        return 0;
    }
    
    return self.compareListInstance.compareList[section].compareItemList.count;
}

//-(CGFloat)      tableView:(UITableView *)tableView
// heightForHeaderInSection:(NSInteger)section
//{
//    return 28;
//}
//
//-(UIView*)     tableView:(UITableView*)tableView
//  viewForHeaderInSection:(NSInteger)section
//{
//    CustomHeaderForCompareList* header=
//    [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[CustomHeaderForCompareList headerReuseID]];
//    
//    return header;
//}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CompareListCell *cell = [tableView dequeueReusableCellWithIdentifier:compareCellReuseID
                                                            forIndexPath:indexPath];
    
    if(cell)
    {
        [cell setCompareItemIntoCell:self.compareListInstance.compareList[indexPath.section].compareItemList[indexPath.row]];
    }
    
    return cell;
}

-(void)         tableView:(UITableView*)tableView
  didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath
                                  animated:YES];
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView
                 editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowActions;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
